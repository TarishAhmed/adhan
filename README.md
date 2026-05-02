# Adhan

A clean, modern Islamic prayer-times companion for Android.

## Features

- **Home dashboard** — large hero card with the next prayer, a live `HH:MM:SS` countdown, a segmented urgency bar, today's full prayer timeline, and a Hijri date footer.
- **Qibla compass** — real-time compass with calibration tips and a map view of your bearing toward the Kaaba.
- **Per-prayer notifications** — enable/disable per prayer, choose from a sound library (with preview), set advance-time minutes, restrict to specific weekdays, and fire a test notification on demand.
- **Smart location** — auto-detect via GPS or search for a city manually; switching cities recalculates everything (prayer times, qibla, home widget).
- **Home-screen widget** — shows the next prayer at a glance.
- **Background scheduling** — uses WorkManager + AlarmManager to keep your daily notifications scheduled even after reboot.
- **Battery optimization helper** — one-time prompt with OEM-specific shortcuts (MIUI, EMUI, etc.) to ensure notifications fire reliably.
- **Onboarding** — first-launch flow to grant location & notification permissions in context.
- **Material 3 Expressive** — M3 NavigationBar, shared-axis transitions, haptic feedback, light/dark/system theming.

## Tech

- Flutter 3.41+ (Dart 3.9+), Material 3
- Riverpod 3 (`hooks_riverpod`, `riverpod_annotation`, `riverpod_generator`)
- `go_router` for navigation
- `flutter_local_notifications` + `workmanager` + `android_alarm_manager_plus` for scheduling
- `geolocator` + `geocoding` + `flutter_compass` + `sensors_plus` for location & compass
- `sqflite` (local cache) + `home_widget` (home-screen widget) + `firebase_remote_config` (force-update)
- `wolt_modal_sheet`, `just_audio`, `hijri`, `skeletonizer`
- Aladhan / al-islam.org timing API (preserved untouched)

## Project layout

```
lib/
  l10n/                 # ARB-driven localization (English shipped)
  model/                # Freezed data models
  navigation/           # Route constants
  providers/            # Riverpod providers (state, router, prayer timings, prefs)
  screens/              # Top-level screens
    home_screen.dart    # Dashboard
    qibla_compass_screen.dart
    notifications_screen.dart
    location_screen.dart
    more_screen.dart
    appearance_screen.dart
    advanced_screen.dart
    onboarding/         # First-launch flow
  services/             # Background, notifications, location storage, qibla, update
  theme/                # Color schemes + design tokens (spacing/radius/motion)
  utils/                # Logger, helpers, greeting, hijri formatting
  widgets/              # Reusable UI: states, progress bar, editor sheet, etc.
```

## Build & run

```sh
flutter pub get
flutter gen-l10n
dart run build_runner build --delete-conflicting-outputs
flutter run
```

## Testing

```sh
flutter analyze
flutter test
```

## License

See [LICENSE](LICENSE).
