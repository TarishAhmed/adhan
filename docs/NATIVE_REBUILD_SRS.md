# Software Requirements Specification (SRS)
## Adhan — Ahmadiyya Muslim Prayer Times App
### Native rebuild source of truth

**Version of current app:** `1.0.10+10`  
**Package / application ID:** `org.tarish.adhan`  
**Display name:** Adhan  
**Current stack:** Flutter 3.41+ / Dart 3.9+, Material 3, Riverpod, go_router  
**Primary platform:** Android (iOS/web/macOS exist as Flutter shells but are not first-class)  
**Audience of this document:** an AI or engineering team rebuilding the product in native Android (Kotlin) and optionally native iOS (Swift). Reproduce **behavior and UX**, not Flutter internals.

This document describes **what the product does today**, including implemented bugs and incomplete features. Where the code and the UI disagree, both are recorded so the native rebuild can choose the intended behavior.

---

## 1. Purpose and product identity

Adhan is a **local, privacy-first prayer-times companion**. It:

1. Fetches **monthly prayer timetables** for the user’s coordinates from **alislam.org** (Ahmadiyya timings — **do not replace with generic AlAdhan/MWL unless explicitly requested**).
2. Shows **today’s next prayer**, a **live countdown**, and a **segmented urgency bar** for the current prayer window.
3. Points **Qibla** with a live compass and a map.
4. Schedules **exact-alarm adhan notifications** per prayer, with per-prayer sound, advance minutes, and weekday chips.
5. Exposes a **home-screen widget** for next prayer.
6. Survives reboot / process death via **WorkManager + exact alarms + boot receivers**.
7. Can **force-update** or **soft-prompt** via Firebase Remote Config.

**Non-goals of the current product (do not invent unless asked):**

- Account / login / cloud sync
- Mosque finder, Quran, hadith, tasbih
- Manual calculation-method picker in UI (AlAdhan method/school params exist as unused leftovers)
- Multi-language UI (English only; language row is a placeholder)
- Persisted theme (theme mode is in-memory only)
- Country line on the widget (always empty)
- Weekday filtering **in the scheduler** (UI exists; scheduler ignores it)

---

## 2. Users and environments

| Item | Requirement |
|---|---|
| Primary user | Muslim (Ahmadiyya community) who wants daily prayer times + adhan alerts |
| Network | Required for first fetch of a month; thereafter SQLite cache works offline |
| GPS | Required for auto location; optional if user picks a city |
| Sensors | Accelerometer + magnetometer **required** on Android (`android.hardware.sensor.*` required=true) |
| Min Android | Flutter default minSdk of this project (check `flutter.minSdkVersion` at build time; compileSdk 36) |
| Permissions | Fine/coarse location, background location declared, POST_NOTIFICATIONS (via plugin), exact alarm, ignore battery optimizations, internet, boot completed, wake lock, high sampling rate sensors |

---

## 3. Information architecture and navigation

### 3.1 Routes

| Path | Kind | Screen |
|---|---|---|
| `/onboarding` | Full-screen, first launch only | 3-page onboarding |
| `/home` | Bottom-nav tab 0 | Home dashboard |
| `/qibla` | Bottom-nav tab 1 | Qibla compass |
| `/more` | Bottom-nav tab 2 | Settings hub |
| `/more/notifications` | Pushed, slide-up | Per-prayer notifications |
| `/more/location` | Pushed, slide-up | Location |
| `/more/appearance` | Pushed, slide-up | Theme + language placeholder |
| `/more/advanced` | Pushed, slide-up | Battery, cache, debug tools |

Redirect rules:

- SharedPreferences key `onboarding_done_v1` (bool).
- If false and not already on onboarding → go to `/onboarding`.
- If true and navigating to onboarding → go to `/home`.
- Initial location: `/home` (then redirect may send to onboarding).

Bottom nav labels: **Home**, **Qibla**, **More**.  
Haptic: `selectionClick` on tab change; ignore re-tapping current tab.

Transitions to reproduce:

- Tab change: fade + scale from 0.94 → 1.0 (~300ms, M3 emphasized decelerate).
- Pushed screens: fade + slide up from 6% of height (~350ms).

### 3.2 App wrapping (global)

Every session wraps the navigator in:

1. **UpdateManager** — Remote Config check after first frame.
2. **BatteryOptimizationWrapper** — one-time battery dialog 2s after launch if `battery_opt_prompted_v1` is not true.

Lifecycle: on `resumed` refresh home widget and start 1-minute widget timer; on `paused`/`detached`/`hidden` stop timer; on `inactive` one last widget update.

---

## 4. Visual design system

### 4.1 Typography

- **UI / numbers:** Inter (variable, including italic). Tabular figures on times and countdown.
- **Headings / greeting / next-prayer name / city on location card:** Noto Serif (variable).

### 4.2 Color (Material 3 seed — copy these tokens)

Light scheme (authoritative):

| Token | Hex |
|---|---|
| primary | `#1B6B51` |
| onPrimary | `#FFFFFF` |
| primaryContainer | `#A6F2D1` |
| onPrimaryContainer | `#00513B` |
| secondary | `#4C6359` |
| secondaryContainer | `#CEE9DB` |
| tertiary | `#3E6374` |
| tertiaryContainer | `#C2E8FD` |
| error | `#BA1A1A` |
| surface | `#F5FBF5` |
| onSurface | `#171D1A` |
| onSurfaceVariant | `#404944` |
| outline | `#707974` |
| outlineVariant | `#BFC9C2` |
| inversePrimary | `#8BD6B6` |

Dark theme exists in `lib/theme/theme.dart` (full MaterialTheme generated schemes). Native rebuild should port both light and dark ColorSchemes from that file.

Urgency bar colors:

- Green band → `colorScheme.primary`
- Yellow band → orange 600
- Red band → `colorScheme.error`

### 4.3 Spacing / radius / motion

| Token | Value |
|---|---|
| xxs–huge | 2, 4, 8, 12, 16, 20, 24, 32, 48 |
| radii | 4, 8, 12, 16, 24, 32 |
| short durations | 50 / 100 / 150 / 200 ms |
| medium | 250 / 300 / 350 / 400 ms |
| long | 450 / 500 / 550 / 600 ms |
| emphasized curve | cubic(0.2, 0, 0, 1) |

Hero cards and chips: 16–24 corner radius, `surfaceContainerHigh` or `primaryContainer` fills.

### 4.4 Theme mode

Appearance screen: segmented control System / Light / Dark. **Not persisted** in current app (resets to System on process death). Native rebuild **SHOULD persist** ThemeMode.

Language: English only; “More languages coming soon”; checkmark on English.

---

## 5. Domain model

### 5.1 Prayers

Canonical 5 salah (UI and countdown): **Fajr, Zuhr, Asr, Maghrib, Isha**.

API also returns **Sunrise** and **Sunset**. These appear in the raw day array but:

- Home timeline **hides** Sunrise and Sunset.
- Next-prayer finder **skips Sunrise**.
- Notifications UI **skips Sunrise** (Sunset is not in the prefs map anyway).
- Scheduler still iterates all prayers in the day array; Sunrise is skipped unless enabled in prefs (default off in bulk-get).

**Spelling:** Zuhr (not Dhuhr). Maghrib (not Magrib).

### 5.2 Prayer array index contract (CRITICAL)

Home countdown / timeline window code indexes **today’s `prayers` list by position**, not by name:

| Index | Assumed prayer |
|---|---|
| 0 | Fajr |
| 1 | (Sunrise — skipped) |
| 2 | Zuhr |
| 3 | Asr |
| 4 | (Sunset — skipped) |
| 5 | Maghrib |
| 6 | Isha |

Native rebuild **MUST NOT rely on this index hack**. Match prayers by `name` enum. If API order ever changes, indexed code breaks.

### 5.3 PrayerName enum

JSON `name` is compared **uppercase** to: `ASR`, `FAJR`, `ISHA`, `MAGHRIB`, `SUNRISE`, `SUNSET`, `ZUHR`.

Fields on `Prayer`:

- `name` — enum
- `time` — epoch milliseconds (JSON number) → DateTime
- `audio` — optional URL string (unused in UI)

`MultiDayTiming`:

- `prayers: List<Prayer>`
- `coordinates: { latitude, longitude }`
- `date` — epoch milliseconds

`PrayerTimingMonthResponseModel`:

- `locationInfo: { lat, lng, timezone }` (strings)
- `multiDayTimings: List<MultiDayTiming>` ordered by day of month

### 5.4 Location record

```
lat: Double
lng: Double
city: String?
timezone: IANA timezone string (device local, e.g. Asia/Kolkata)
```

Coordinates **stored as strings with 2 decimal places** (`toStringAsFixed(2)`). This is the cache key (~1 km). Always format the same way before SQLite lookup.

### 5.5 Prayer window (home hero)

```
current: PrayerTime        // salah that has already started (or synthetic Isha before Fajr)
next: PrayerTime           // upcoming salah
progress: 0..1 or null
elapsed, remaining: Duration?
urgency: green | yellow | red
segments: [{start, end, urgency}]  // 0..1 along the window
```

---

## 6. External APIs

### 6.1 Prayer times (MUST keep)

```
GET https://www.alislam.org/adhan/api/timings/month
Query:
  lat: string (2-decimal)
  lng: string (2-decimal)
  month: int 1–12
  year: int
Timeouts: connect 30s, receive 30s
Success: HTTP 200 + JSON body matching PrayerTimingMonthResponseModel
```

Do **not** switch to `https://api.aladhan.com/v1/timings` (commented-out leftover).

### 6.2 Adhan MP3 library

Base: `https://raw.githubusercontent.com/TarishAhmed/Athan-MP3/master/Sounds/`

Catalog (display name → filename; URL-encode spaces):

| Display name | File |
|---|---|
| Default Notification Sound | internal sentinel `defaultNotificationSound` (no download) |
| Makkah | `Athan Makkah.mp3` **(library default)** |
| Mishary Alafasi | `Athan Mishary Alafasi.mp3` |
| Mansoor Az-Zahrani | `Athan Mansoor Az-Zahrani.mp3` |
| Hamdan Almalki | `Athan Hamdan Almalki.mp3` |
| Hamad Deghreri | `Athan Hamad Deghreri.mp3` |
| Ibrahim Al-Arkani | `Athan Ibrahim Al-Arkani.mp3` |
| Majed Al-Hamathani | `Athan Majed Al-hamathani.mp3` |
| Malek Chebae (Fajr) | `Athan Al-fajer - Malek chebae.mp3` |
| Mohammad Almenshawy | `Athan Mohammad Almenshawy.mp3` |
| Mohammad Ref'at | `Athan Mohammad Ref3at.mp3` |
| Nasser Alqatami | `Athan Nasser Alqatami.mp3` |
| Suhaib Khatba | `Athan Suhaib Khatba.mp3` |
| Abed Albase | `Athan Abed Albase6.mp3` |
| Ahmad Nuyne | `Athan Ahmad Nuyne3.mp3` |
| Feroz Alam | `Azan_FerozAlam.mp3` |
| Mishary Rashid Alafasy | `mishary_rashid_alafasy.mp3` |
| Mishary Rashid Alafasy 2 | `mishary_rashid_alafasy_2.mp3` |
| Mishary Rashid Alafasy 3 | `mishary_rashid_alafasy_3.mp3` |
| Mansour Al-Zahrani | `mansour-al-zahrani.mp3` |
| Hafiz Mustafa Ozcan | `hafiz_mustafa_ozcan.mp3` |
| Karl Jenkins | `karl_jenkins.mp3` |
| Ahmad Al Nafees | `ahmad_al_nafees.mp3` |

Downloaded files live in app support dir `/adhan/`. For a given prayer, a copy is made as `{prayerKey}.mp3` (e.g. `fajr.mp3`). Android FileProvider:

- Authority: `org.tarish.adhan.fileprovider`
- Notification sound URI: `content://org.tarish.adhan.fileprovider/adhan/{prayer}.mp3`
- `file_paths.xml` maps `files-path` name `adhan` → `adhan/`

### 6.3 Firebase Remote Config

Defaults:

| Key | Default |
|---|---|
| `force_update_version` | `1.0.0` |
| `force_update_url` | `""` |
| `general_update_version` | `1.0.0` |
| `general_update_url` | `""` |

Fetch timeout 1 minute; minimum fetch interval 1 hour.

Version compare: split on `.`, pad to 3 numeric parts, compare major then minor then patch. `isVersionHigher(remote, current)` is true only if remote is **strictly greater**.

- If force version > current → **blocking** full-screen “Update Required” (back disabled). CTA opens URL in external browser.
- Else if general version > current → **dismissible** dialog once per session.
- Else continue.

Errors must not block the app.

### 6.4 Geocoding / GPS

- GPS: high accuracy, 10s timeout.
- Reverse geocode: `placemark.locality`.
- Forward geocode for city search: `locationFromAddress`, debounce 400ms, min query length 2.

---

## 7. Persistence

### 7.1 SharedPreferences keys

| Key | Type | Meaning |
|---|---|---|
| `onboarding_done_v1` | bool | Onboarding completed / skipped |
| `battery_opt_prompted_v1` | bool | Battery dialog shown once |
| `settings_auto_location` | bool | Default **true** |
| `stored_lat` / `stored_lng` | string | 2-decimal coords |
| `stored_timezone` | string | IANA |
| `stored_city` | string | Display name |
| `needs_reschedule` | bool | Background self-heal flag |
| `db_metrics` | string | Debug dump of DB stats |
| `notification_pref_{prayer}` | bool | Per-prayer enable |
| `notification_sound_{prayer}` | string | Sound URL |
| `notification_advance_{prayer}` | int | Minutes 0–30 |
| `notification_days_{prayer}` | string | CSV of `Mon,Tue,...` |

Prayer keys: `fajr`, `sunrise`, `zuhr`, `asr`, `maghrib`, `isha`.

**Default enable inconsistency (MUST resolve in native):**

- `getPrayerNotificationEnabled` defaults **true** if missing.
- `getAllNotificationPreferences` / `getSpecificNotificationPreferences` (what the UI and scheduler use) default **false**.

**Effective UX today:** all prayers start **OFF** until the user toggles them on.

Sound default when missing: Makkah URL.  
Advance default: 0.  
Days default: all seven abbreviations.

### 7.2 SQLite `prayer_timings.db` v2

**Table `prayer_timings`**

```
id INTEGER PK AI
year, month, day INTEGER NOT NULL
location_lat, location_lng, location_timezone TEXT
prayer_data TEXT NOT NULL   -- JSON of one MultiDayTiming
created_at INTEGER NOT NULL -- epoch ms
UNIQUE(year, month, day, location_lat, location_lng)
INDEX (year, month, location_lat, location_lng)
INDEX (created_at)
```

**Table `location_info`**

```
id INTEGER PK AI
lat TEXT NOT NULL
lng TEXT NOT NULL
timezone TEXT
last_updated INTEGER NOT NULL
UNIQUE(lat, lng)
```

Cache rules:

- Read month from DB first. Treat as valid if **any** day’s `date` is after now.
- Else fetch API and upsert (replace on conflict).
- Proactive: when within 3 days of month end, prefetch current + next 2 months (3 months total).
- Cleanup: delete rows with `created_at` older than 90 days (weekly job).
- Clear-all: wipe both tables (Advanced → Cached data).

Riverpod also JSON-persists the current month until end-of-month; native can skip this second cache if SQLite is enough.

---

## 8. Feature specifications (screens)

### 8.1 Onboarding (first launch)

3 pages, skip always available (top-right). Completing skip or last CTA sets `onboarding_done_v1` and goes Home.

1. **Welcome** — icon moon; title “Welcome to Adhan”; body “Accurate prayer times, Qibla direction, and gentle reminders — wherever you are.” CTA Next.
2. **Location** — requests OS location permission, then Next. Body claims location never leaves the device (geocoding still uses OS geocoder / network).
3. **Notifications** — requests notification permission, then finishes.

Page indicator: 3 dots; selected is 24×8 pill, others 8×8.

### 8.2 Home

**App bar (large, pinned):** time-of-day greeting (Noto Serif):

| Local hour | Greeting |
|---|---|
| 00–04 | Peaceful night |
| 05–11 | Good morning |
| 12–16 | Good afternoon |
| 17–20 | Good evening |
| 21–23 | Peaceful night |

Actions: city **ActionChip** (opens Location) + refresh icon.

**Pull-to-refresh / refresh button:** refetch month for current location, update widget, snackbar success or failure.

**Hero card** (primaryContainer → surfaceContainerHigh gradient, 24 radius):

- Label `UP NEXT` (letter-spacing 1.2)
- Next prayer name (displaySmall, Noto Serif)
- Next prayer clock time (`DateFormat.jm()` — locale 12h/24h)
- Live `HH:MM:SS remaining` updating every 1s (Inter, tabular, fade on digit change). Clamp remaining to 0..2 days.
- Segmented progress bar of **current window** (not of the countdown itself)
- Caption left = current prayer name; right = next prayer name

**Today timeline:** horizontal chips, width 96, height 96. Five salah. Current window chip: primaryContainer + 2px primary border. Time `jm()`. Current = now ∈ [this prayer, next prayer). Last prayer of day stays current after its start until midnight logic of the window.

**Quick actions row:** Qibla / Notifications / Location (three tiles).

**Footer:** Gregorian `yMMMMd` + Hijri `"{day} {longMonthName} {year} AH (approx.)"` via tabular Hijri (Umm al-Qura, package `hijri`). Label as approximate.

**Empty/error:** location failure → icon + retry invalidates location. Prayer fetch failure → retry invalidates month provider. Loading: skeletonizer mimicking hero/timeline.

### 8.3 Qibla

Kaaba constants: **21.4225 N, 39.8262 E**.

Bearing (degrees 0–360):

```
y = sin(Δlng) * cos(lat2)
x = cos(lat1)*sin(lat2) - sin(lat1)*cos(lat2)*cos(Δlng)
bearing = atan2(y, x) → degrees, (bearing + 360) % 360
```

Compass needle angle = `qibla - heading`, normalized to [-180, 180].

Distance: geodesic meters / 1000.

Accuracy labels: <5 Excellent, <10 Good, <20 Fair, else Poor.

UI:

- Calibration tips: figure-8, away from metal, place flat. Show tilt degrees from accelerometer: `tilt = 90 - clamp(|z|/9.81, 0, 1)*90`.
- Compass widget (heading, accuracy, qibla, distance).
- Map widget (`flutter_map` / OSM) showing user vs Kaaba bearing.
- Refresh: haptic + re-read location.
- If no compass sensor: error state “Compass sensor not available on this device.”

### 8.4 More hub

Sections:

- Prayer → Notifications, Location
- Appearance → Theme
- Advanced → Battery / cached data (debug extras in debug builds)
- About → system About dialog: name Adhan, version `version (build)`, legalese `© {year} Adhan`

### 8.5 Notifications

If OS notifications disabled: errorContainer banner + Enable (re-request permission; Android dialog if still denied).

List **Fajr, Zuhr, Asr, Maghrib, Isha** (not Sunrise). Each card:

- Name + today’s time
- Subtitle: sound display name + optional ` • N min before`
- Switch (default off)
- Tap → Wolt-style 2-page modal:

**Page 1**

- Day chips Mon–Sun (persisted; **scheduler currently ignores** — native SHOULD honor: skip schedule if today’s weekday abbreviation not selected)
- Sound row → page 2
- Advance slider 0–30 minutes, **6 divisions** (0, 5, 10, 15, 20, 25, 30)
- Test notification: ensure sound file, schedule in **2 seconds**, snackbar “Test notification scheduled — fires in 2s”. Title `Test — {prayerKey}`, body `This is a test notification.` ID `999000 + hash(prayerKey)%1000`

**Page 2**

- ChoiceChips for entire `AdhanAudioLibrary`
- Selecting downloads MP3 if needed, copies to `{prayer}.mp3`, previews with in-app audio player
- Internal “Default Notification Sound” skips download

Notification copy when firing for real:

- Title: prayer display name (e.g. `Fajr`)
- Body: `It's time for {displayName} prayer.`

Android channel per prayer:

- ID `{prayer}_prayer_channel`
- Group `{prayer}_prayer_channel_group`
- Importance MAX, sound, vibration, lights, badge
- `AudioAttributesUsage.alarm`, category alarm
- `timeoutAfter` 1 hour
- Public visibility
- Exact alarm (`AndroidScheduleMode.exact`)
- If scheduled time is in the past, add 1 day (scheduler usually skips past times instead)

**MUST:** request `SCHEDULE_EXACT_ALARM` / `USE_EXACT_ALARM` and handle Android 14+ permission.

Changing any pref sets `needs_reschedule` and enqueues WorkManager one-off `rescheduleAll` after 5 seconds.

### 8.6 Location

Card: city (Noto Serif) or lat/lng fallback; coords to 4 decimals; “Last updated: {MMMd jm of now}” (note: uses **now**, not stored timestamp).

- Button **Use current location** → auto-location true, invalidate GPS fetch.
- Switch **Auto-detect location** bound to `settings_auto_location`.
- Search field hint `e.g. Mecca, London, Karachi`. Results from geocoding. Selecting a result: reverse-geocode city, store location (device timezone — **not** the city’s timezone), **turn auto-location OFF**, invalidate prayer month, update widget, pop.

Location change > ~1.1 km (`0.01°`) should rewrite cache and trigger reschedule.

### 8.7 Advanced

- Android only: Battery optimization tile with live status.
- Cached data: stats (prayer_records, location_records, database_size, generated_at) + clear all.
- Debug-only: force background jobs, force widget update.

Battery dialog (first launch if **already ignoring** optimizations — note the inverted condition in current code: dialog shows when `isIgnoringBatteryOptimizations == true`. Native SHOULD invert this: prompt when **not** ignoring.)

Copy:

- Disable Android battery optimization
- Allow background / autostart (OEM)
- Lock in recents (MIUI/EMUI)

OEM shortcuts:

- Xiaomi/Redmi/Poco → MIUI autostart + powerkeeper
- Huawei/Honor → EMUI startup manager
- Samsung → APP_BATTERY_SETTINGS
- OnePlus/Oppo/Realme → application details

Native method channel `app_system_utils`:

- `isIgnoringBatteryOptimizations`
- `requestDisableBatteryOptimization`
- `openBatteryOptimizationSettings`
- `getUriForFile` `{ path }`
- `getNotificationChannels`

### 8.8 Updates

Force screen: cannot back out; “Update Required”; “A critical update is required…”; version + Update button.

General dialog: dismissible; optional later.

---

## 9. Prayer window / urgency algorithm (MUST match)

Prayers considered for windows: Fajr, Zuhr, Asr, Maghrib, Isha, plus **tomorrow’s Fajr** as the end of Isha.

Find `i` such that `current.time <= now < next.time`.

Progress = elapsedSeconds / totalSeconds.

**Always red** if remaining ≤ 10 minutes.

Otherwise by current prayer:

| Current | Green until | Then yellow |
|---|---|---|
| Fajr | first **1/3** of Fajr→Zuhr | rest (until 10-min red tail) |
| Zuhr | first **1/2** of Zuhr→Asr | rest |
| Asr | first **1/2** of Asr→Maghrib | rest |
| Maghrib | first **20%** of Maghrib→Isha | rest |
| Isha | until `Maghrib + (nextFajr - Maghrib)/2` (Islamic midnight) | after midnight |

Segments for the bar: `[0, greenEnd]=green`, `[greenEnd, redStart]=yellow`, `[redStart, 1]=red` where `redStart = (totalSeconds - 600) / totalSeconds`.

**Before today’s Fajr:** synthetic current = Isha at `now`, next = today’s Fajr, progress null, remaining = Fajr − now, urgency yellow, segments 0–2/3 green, 2/3–0.9 yellow, 0.9–1 red.

Hero displays **next** prayer (upcoming), not current.

Timeline stream ticks every **1 minute**; countdown ticks every **1 second**.

Tomorrow Fajr for “after Isha”: if today is last day of cached month, `tomorrowsPrayers` is null — next-day Fajr missing until next month cached. Native SHOULD fetch tomorrow across month boundary.

---

## 10. Background work

### 10.1 On every cold start (non-web)

1. Init notifications + timezones
2. Init AlarmManager
3. Init WorkManager (`callbackDispatcher` isolate)
4. `rescheduleAfterBootOrAppStart`:
   - register periodic tasks
   - schedule remaining today notifications
   - clear `needs_reschedule`
5. Update home widget immediately, again at +3s, and every 1 min while foreground

### 10.2 WorkManager tasks

| Unique name | Type | When | Work |
|---|---|---|---|
| `checkAndFetchPrayerTimings` | periodic 1 day, network | keep | fetch current+next month if missing; near month-end prefetch 3 months; self-heal if `needs_reschedule`; update widget |
| `cleanupAndMetricsTask` | periodic 7 days, network | keep | delete >90d rows; persist `db_metrics` |
| `planNextDayNotifications` | one-off at next local midnight | replace | schedule today’s (next day’s) notifications; widget; re-enqueue midnight |
| `fetchNextMonthPrayerTimings` | one-off last day of month 02:00 | replace | same as check-and-fetch |
| `updateHomeWidget` | periodic **15 min**, network | keep | widget update |
| `rescheduleAll` | one-off ~5s | replace | full reschedule |
| `scheduleDailyNotifications` | (legacy name still handled) | | schedule today |
| `testNotifications` | debug | | Fajr test in 5s (legacy; UI test uses 2s) |

Constraints: `NetworkType.connected` even for planning (plugin quirk). Battery-not-low **false**.

### 10.3 Daily notification scheduling

1. Read stored location; abort if none.
2. Load today’s timings from cache/API.
3. Load enable + advance maps.
4. Cancel today’s IDs for all 6 prayer keys.
5. For each prayer with name+time:
   - skip if pref false
   - fire time = prayer.time − advanceMinutes
   - skip if fire time not in the future
   - ID = `hash("{prayer}-{yyyy-MM-dd}") & 0x7FFFFFFF`
   - schedule exact zoned notification in **local TZ**

**Native SHOULD also:** skip if weekday not in selected days; schedule **tomorrow** at midnight even if app never opens; request full-screen intent / alarm clocks if targeting lock screen adhan.

Boot: `BOOT_COMPLETED`, `MY_PACKAGE_REPLACED`, HTC/QuickBoot, Flutter local-notifications boot receiver, AlarmManager reboot receiver (currently `enabled=false` — native SHOULD enable).

---

## 11. Home screen widget (Android)

Provider: `org.tarish.adhan.AdhanHomeWidget`  
Layout: `adhan_home_widget.xml`  
Min size: 110×40 dp, resizable H+V, home + keyguard, system updatePeriod 24h (app updates more often).

Shared data keys (HomeWidget prefs):

| Key | Example |
|---|---|
| `_group` | `adhan_home_widget` |
| `next_prayer_name` | `Maghrib` |
| `next_prayer_time` | `6:45 PM` (`DateFormat.jm`) |
| `time_remaining` | `now` / `12 min` / `2 h` / `1 h 5 m` |
| `location_city` | city or `""` |
| `location_country` | always `""` today |

Next prayer: first of today’s prayers with time > now, **skipping Sunrise**; else tomorrow Fajr.

Compact layout if minWidth < 150 **or** minHeight < 120: hide logo, hide AM/PM, hide location, time 32sp. Else time 42sp, AM/PM split from last 2 chars if `AM`/`PM`.

Remaining formatter uses **absolute minutes** (shows positive even if slightly negative).

iOS widget: not implemented.

---

## 12. Permissions and Android manifest extras

Must declare (current):

- INTERNET
- ACCESS_FINE_LOCATION, ACCESS_COARSE_LOCATION, ACCESS_BACKGROUND_LOCATION
- RECEIVE_BOOT_COMPLETED
- SCHEDULE_EXACT_ALARM, USE_EXACT_ALARM
- REQUEST_IGNORE_BATTERY_OPTIMIZATIONS
- WAKE_LOCK, FOREGROUND_SERVICE
- HIGH_SAMPLING_RATE_SENSORS
- WRITE_EXTERNAL_STORAGE maxSdk 28

Features required: accelerometer, magnetometer.

FileProvider authority `org.tarish.adhan.fileprovider`.

POST_NOTIFICATIONS is requested at runtime (Android 13+).

---

## 13. Copy deck (English)

Use `lib/l10n/app_en.arb` as the canonical string table. All user-visible English is there except a few hardcoded strings:

- Notification body `It's time for {name} prayer.`
- Permission dialogs “Notification Permission Required”
- Battery dialogs
- Force update “Update Required”
- Test notification titles
- Appearance “More languages coming soon”
- Advanced debug labels
- Widget remaining `now` / `min` / `h`

Onboarding location claim: “Nothing leaves your device.” — geocoding and alislam.org **do** use network. Native copy SHOULD be honest: coordinates are sent to alislam.org for timetables.

---

## 14. Acceptance criteria (rebuild)

A native build is complete when:

1. First launch onboarding → Home; skip works; returning users never see onboarding.
2. With GPS, today’s 5 salah match alislam.org for that lat/lng/month.
3. Hero next-prayer name/time and 1s countdown match wall clock; bar colors follow §9 including last-10-minutes red and Isha midnight split.
4. Pull-to-refresh updates times and widget.
5. Manual city search changes times, qibla, widget, and stays until “Use current location”.
6. Qibla bearing within ~5° of known cities (NYC ~58.5°, London ~118°, Tokyo ~293°) and live compass rotates.
7. Enabling Fajr + sound Makkah + 0 advance fires an alarm-category notification at Fajr with Makkah audio after download.
8. Advance 15 min fires 15 minutes before.
9. Test notification fires in ~2s with selected sound.
10. After reboot, remaining today’s notifications still fire (exact alarms restored).
11. Widget shows next prayer name, time, remaining, city; compact vs expanded.
12. Force Remote Config version higher than app blocks UI; general version shows dismissible prompt.
13. Battery settings reachable; OEM shortcuts for Xiaomi/Huawei/Samsung/Oppo family.
14. Offline: previously cached month still renders Home.
15. Theme light/dark/system; fonts Inter + Noto Serif; teal M3 palette.

---

## 15. Recommended native architecture

Not required to copy Flutter/Riverpod. Suggested:

```
ui/          Compose / SwiftUI screens
domain/      PrayerWindow, QiblaBearing, Greeting, Hijri
data/
  remote/    AlislamApi, GithubAdhanSounds, RemoteConfig
  local/     Room/SQLite, DataStore prefs
  location/  FusedLocation + Geocoder
scheduling/  AlarmManager exact + WorkManager
widget/      Glance / AppWidget
sensors/     Rotation vector / compass
```

Single source of truth for “today’s prayers” in a repository. Derive next prayer, window, widget payload, and alarm list from that.

Use **name matching**, never list index.

Honor weekday chips in the alarm planner (fix current gap).

Persist theme. Default notifications: product decision — recommend **all ON** for a prayer app, with OS permission as the gate; current app defaults OFF.

Timezone: store **location timezone** when user picks a city (use a TZ lookup from lat/lng). Current app uses **device** timezone even for a searched city — times from API are absolute instants, so display is OK if you use the API DateTime as local wall time as returned.

---

## 16. Known defects to fix or preserve

Recorded so the rebuild is intentional:

1. Notification defaults disagree (true vs false).
2. Weekday chips persist but **do not affect scheduling**.
3. Battery prompt condition inverted (`show when already ignoring`).
4. `getPrayerNotificationEnabled` unused by scheduler.
5. Theme not persisted.
6. Widget country always empty; remaining not shown in layout XML (computed `combined` unused).
7. `AlarmBroadcastReceiver` reboot receiver `android:enabled="false"`.
8. Before-Fajr window uses synthetic Isha at `now` (odd current label).
9. Month-boundary tomorrow Fajr missing from in-memory month list.
10. `PrayerDataManager._getTimezone()` hardcodes `UTC` on date fallback path.
11. Background widget task requires network unnecessarily.
12. Compass hardware **required=true** excludes devices without magnetometer from Play install.
13. Home uses prayer **index** 0/2/3/5/6.
14. Test snackbar says 2s; legacy `testNotifications` uses 5s.

---

## 17. Assets to port

- `assets/fonts/Inter-VariableFont_opsz,wght.ttf` (+ italic)
- `assets/fonts/NotoSerif-VariableFont_wdth,wght.ttf` (+ italic)
- `assets/icon/logo.svg`
- `assets/pngs/logo_background.png`
- Android adaptive icon `ic_launcher`
- Widget drawables `adhan_widget_bg`, Material widget background
- Firebase `google-services.json` / `firebase_options.dart` (do not commit secrets into the spec; copy from project)

---

## 18. Test seeds (from current unit tests)

Qibla:

- NYC (40.7128, -74.0060) ≈ 58.5° ± 5, distance ~10,000 km ± 1,000
- London (51.5074, -0.1278) ≈ 118° ± 5
- Tokyo (35.6762, 139.6503) ≈ 293° ± 5

Coordinate validation: lat ∈ [-90,90], lng ∈ [-180,180].

Update version: `1.0.10` vs `1.0.11` → general/force as configured.

---

## 19. Out-of-scope leftovers (do not port unless needed)

- Commented AlAdhan daily timings provider (`method=1, school=0, latitudeAdjustmentMethod=0`)
- `adhan` Dart package dependency (unused for calculation; API is source of truth)
- Web hash-URL + sqflite_ffi_web
- `AppSettings.calculationMethod = 'MWL'` unused by fetch
- Language setting unused
- `audio` field on Prayer unused
- Master toggle string `notificationsMasterToggle` unused on the rebuilt Notifications screen

---

## 20. Rebuild prompt (paste to the native agent)

> Rebuild **Adhan** (`org.tarish.adhan`) as a native Android app (Kotlin + Jetpack Compose + Room + WorkManager + AlarmManager + Glance widget). Optionally iOS later.
>
> Follow `docs/NATIVE_REBUILD_SRS.md` as the only product spec. Preserve alislam.org monthly timings API, Qibla math, prayer-window urgency colors, notification channel-per-prayer + FileProvider sounds, onboarding, home hero countdown, and Remote Config force update.
>
> Fix: weekday filtering in scheduler, notification default-off vs on (choose all-on with permission gate), persist theme, battery prompt when optimization is **still enabled**, match prayers by name not index, schedule across month boundary, enable boot receivers, show remaining time on the widget.
>
> Visual: M3 teal palette in §4, Inter + Noto Serif, 3-tab Home/Qibla/More.
>
> Do not add accounts, Quran, or a different calculation API.

---

*Generated from the Flutter codebase at `/home/tarish/work/adhan` (version 1.0.10+10). If code and this SRS diverge later, trust the code and update this file.*
