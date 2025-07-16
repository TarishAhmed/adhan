# Notification System Implementation

## Overview

The notification system provides comprehensive prayer time notification management with the following features:

- **Daily Notification Scheduling**: Automatically schedules notifications at 2 AM for the entire day
- **Individual Prayer Preferences**: Users can enable/disable notifications for each prayer time
- **Custom Sounds**: Choose from multiple adhan sounds for each prayer
- **Advance Notifications**: Set advance notification times (0-30 minutes) for each prayer
- **Background Service Integration**: Works with the existing background prayer service

## Architecture

### Core Components

1. **NotificationPreferencesService** (`lib/services/notification_preferences_service.dart`)
   - Manages individual prayer notification preferences
   - Stores settings in SharedPreferences
   - Handles sound and advance time preferences

2. **DailyNotificationScheduler** (`lib/services/daily_notification_scheduler.dart`)
   - Schedules daily notifications at 2 AM
   - Integrates with WorkManager for background execution
   - Reschedules notifications when preferences change

3. **NotificationSettingsScreen** (`lib/screens/notification_settings_screen.dart`)
   - Comprehensive UI for managing notification preferences
   - Test notification functionality
   - Reset preferences option

4. **Background Service Integration** (`lib/services/background_prayer_service.dart`)
   - Integrates daily notification scheduling with existing background tasks
   - Runs at 2 AM daily to schedule notifications for the entire day

## Features

### Daily Notification Scheduling

- **Automatic Scheduling**: Runs daily at 2 AM via WorkManager
- **Smart Scheduling**: Only schedules notifications for enabled prayers
- **Advance Time Support**: Respects user's advance notification preferences
- **Sound Customization**: Uses user's selected adhan sounds
- **Future-Only**: Only schedules notifications for times that haven't passed

### Individual Prayer Preferences

Each prayer time (Fajr, Sunrise, Dhuhr, Asr, Maghrib, Isha) has:
- **Enable/Disable Toggle**: Turn notifications on/off per prayer
- **Sound Selection**: Choose from 8 different adhan sounds
- **Advance Time**: Set 0-30 minutes advance notification
- **Test Functionality**: Test notifications immediately

### Notification Sounds

Available adhan sounds:
- Default Ringtone (system default)
- Mishary Rashid Alafasy (3 variants)
- Mansour Al Zahrani
- Hafiz Mustafa Ozcan
- Karl Jenkins
- Ahmad Al Nafees

### Advance Notification Times

- **Range**: 0-30 minutes before prayer time
- **Granularity**: 5-minute increments
- **Per Prayer**: Each prayer can have different advance times
- **Real-time Updates**: Changes apply immediately

## Implementation Details

### Background Service Integration

The daily notification scheduler integrates with the existing background prayer service:

```dart
// In BackgroundPrayerService
static Future<void> scheduleBackgroundTasks() async {
  // Existing prayer timing tasks...
  
  // Schedule daily notification scheduling
  await DailyNotificationScheduler.scheduleDailyNotificationTask();
}
```

### WorkManager Tasks

Two main background tasks:
1. **`scheduleDailyNotifications`**: Runs daily at 2 AM to schedule notifications
2. **`checkAndFetchPrayerTimings`**: Existing task for prayer timing updates

### Notification ID Generation

Unique notification IDs are generated using:
```dart
static int _getNotificationId(String prayerName, DateTime date) {
  final dateString = '${date.year}${date.month.toString().padLeft(2, '0')}${date.day.toString().padLeft(2, '0')}';
  final prayerHash = prayerName.toLowerCase().hashCode;
  return int.parse('$dateString$prayerHash');
}
```

### Preference Storage

All preferences are stored in SharedPreferences with prefixes:
- `notification_pref_`: Enable/disable preferences
- `notification_sound_`: Sound preferences
- `notification_advance_`: Advance time preferences

## Usage

### For Users

1. **Access Settings**: Go to Settings → Notification Settings
2. **Enable Prayers**: Toggle switches for desired prayer times
3. **Customize Sounds**: Select adhan sounds for each prayer
4. **Set Advance Times**: Use sliders to set advance notification times
5. **Test Notifications**: Use test buttons to verify settings
6. **Reset Preferences**: Use menu to reset all preferences

### For Developers

#### Adding New Prayer Times

1. Update `NotificationPreferencesService.prayerNames`
2. Add prayer enum mapping in `DailyNotificationScheduler._getPrayerName()`
3. Update UI in `NotificationSettingsScreen`

#### Adding New Sounds

1. Add to `AdhanSound` enum in `notification_service.dart`
2. Update sound mapping in `DailyNotificationScheduler._getAdhanSound()`
3. Add to sound options in `NotificationSettingsScreen`

#### Modifying Scheduling Logic

1. Edit `DailyNotificationScheduler.scheduleDailyNotifications()`
2. Update WorkManager task registration
3. Modify callback dispatcher in `main.dart`

## Testing

### Manual Testing

1. **Test Individual Notifications**: Use test buttons in settings
2. **Test Daily Scheduling**: Manually trigger `scheduleDailyNotifications()`
3. **Test Background Service**: Verify WorkManager integration
4. **Test Preference Persistence**: Restart app and verify settings

### Automated Testing

- Unit tests for `NotificationPreferencesService`
- Widget tests for `NotificationSettingsScreen`
- Integration tests for background scheduling

## Troubleshooting

### Common Issues

1. **Notifications Not Appearing**
   - Check notification permissions
   - Verify WorkManager is running
   - Check device battery optimization settings

2. **Wrong Notification Times**
   - Verify timezone settings
   - Check advance time preferences
   - Ensure prayer timing data is accurate

3. **Background Service Not Working**
   - Check WorkManager initialization
   - Verify task registration
   - Check device-specific restrictions

### Debug Information

Enable debug logging:
```dart
// In main.dart
isInDebugMode: true,
```

Check logs for:
- Daily notification scheduling status
- Preference loading/saving
- Background task execution
- Notification scheduling errors

## Future Enhancements

1. **Smart Notifications**: Adjust based on user behavior
2. **Location-based Timing**: Different settings per location
3. **Prayer Time Adjustments**: Manual prayer time adjustments
4. **Notification History**: Track delivered notifications
5. **Advanced Scheduling**: Custom scheduling patterns
6. **Notification Analytics**: Usage statistics and insights

## Dependencies

- `shared_preferences`: Preference storage
- `workmanager`: Background task scheduling
- `flutter_local_notifications`: Local notification display
- `timezone`: Timezone handling
- `riverpod`: State management

## Security Considerations

- Notification preferences are stored locally
- No sensitive data in notifications
- Background tasks have minimal permissions
- User consent required for notifications 