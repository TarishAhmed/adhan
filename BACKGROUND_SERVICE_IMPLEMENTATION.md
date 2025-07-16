# Background Service Implementation

This document describes the background service implementation for automatically fetching and storing prayer timing data in the Adhan app.

## Overview

The background service ensures that the app always has prayer timing data available by automatically fetching data for the current and next month. It runs in the background using WorkManager and operates independently of the main app.

## Architecture

### 1. Background Prayer Service (`lib/services/background_prayer_service.dart`)
- Handles all background task scheduling and execution
- Uses WorkManager for reliable background task execution
- Implements intelligent scheduling based on calendar dates
- Provides comprehensive error handling and logging

### 2. Location Storage Service (`lib/services/location_storage_service.dart`)
- Manages location data persistence for background service use
- Stores location in SharedPreferences for reliable access
- Handles location change detection and updates
- Provides location validation and cleanup

### 3. Background Service Provider (`lib/providers/background_service_provider.dart`)
- Riverpod provider for background service management
- Provides UI controls for service start/stop
- Offers manual trigger capabilities
- Reports service status and health

## Key Features

### 1. Automatic Scheduling
- **Daily Check**: Runs every day to check if prayer timing data is available
- **Monthly Fetch**: Automatically fetches next month's data on the last day of current month
- **Smart Timing**: Schedules tasks at 2 AM to minimize battery impact
- **Location Aware**: Only fetches data for the user's current location

### 2. Intelligent Data Management
- **Current Month**: Ensures current month data is always available
- **Next Month**: Pre-fetches next month's data before it's needed
- **Location Changes**: Automatically updates when user location changes
- **Data Validation**: Checks data validity before using cached data

### 3. Battery Optimization
- **Network Constraints**: Only runs when network is available
- **Battery Friendly**: Doesn't require charging or specific battery level
- **Idle Mode**: Can run when device is idle
- **Storage Efficient**: Manages storage space automatically

## Scheduling Logic

### Daily Check Task
```dart
// Runs every day
await Workmanager().registerPeriodicTask(
  'checkAndFetchPrayerTimings',
  'checkAndFetchPrayerTimings',
  frequency: const Duration(days: 1),
  constraints: Constraints(
    networkType: NetworkType.connected,
    requiresBatteryNotLow: false,
    requiresCharging: false,
    requiresDeviceIdle: false,
    requiresStorageNotLow: false,
  ),
);
```

### Monthly Fetch Task
```dart
// Runs on the last day of each month at 2 AM
final scheduleDay = daysInMonth; // Last day of the month
final scheduleDate = DateTime(now.year, now.month, scheduleDay, 2, 0);
```

## Data Flow

### 1. App Startup
1. Initialize background service
2. Schedule daily and monthly tasks
3. Store current location for background use

### 2. Daily Background Check
1. Check if current month data exists
2. Check if next month data exists
3. Fetch missing data from API
4. Store data in local database
5. Reschedule next month fetch

### 3. Monthly Background Fetch
1. Fetch next month's prayer timings
2. Store data in local database
3. Schedule next month's fetch task

### 4. Location Change
1. Detect location change (more than 1km)
2. Clear old location data
3. Fetch new location data
4. Update background service location

## Settings Integration

The settings screen includes a "Background Service" section that provides:

### Service Status
- Location stored status
- Service running status
- Current location coordinates

### Manual Controls
- **Start Service**: Enable automatic updates
- **Stop Service**: Disable automatic updates
- **Manual Fetch**: Trigger immediate data fetch

## Error Handling

### Network Issues
- Graceful fallback when network is unavailable
- Retry logic for failed API calls
- Logging for debugging network issues

### Database Issues
- Automatic cleanup of corrupted data
- Fallback to API when database is unavailable
- Error recovery mechanisms

### Location Issues
- Default location fallback
- Location permission handling
- Location service availability checks

## Performance Benefits

1. **Always Available Data**: Prayer timings are always cached locally
2. **Reduced API Calls**: Only fetches when data is missing
3. **Faster App Startup**: No waiting for API calls on app launch
4. **Offline Support**: App works completely offline with cached data
5. **Battery Efficient**: Minimal battery impact with smart scheduling

## Implementation Details

### WorkManager Integration
```dart
// Initialize WorkManager
await Workmanager().initialize(callbackDispatcher, isInDebugMode: false);

// Register periodic task
await Workmanager().registerPeriodicTask(
  taskName,
  taskName,
  frequency: const Duration(days: 1),
  constraints: Constraints(networkType: NetworkType.connected),
);
```

### Location Storage
```dart
// Store location for background service
await LocationStorageService.storeLocation(
  lat: position.latitude,
  lng: position.longitude,
  timezone: timezone,
  city: city,
);
```

### Database Integration
```dart
// Check if data exists
final hasData = await PrayerDataManager.hasDataForMonth(
  year: currentYear,
  month: currentMonth,
  lat: location['lat']!,
  lng: location['lng']!,
);

// Fetch and store if missing
if (!hasData) {
  await _fetchAndStorePrayerTimings(year, month, location);
}
```

## Testing

### Manual Testing
1. **Start Service**: Use settings to start background service
2. **Check Logs**: Monitor console logs for background task execution
3. **Verify Data**: Check database for stored prayer timing data
4. **Location Change**: Test with different locations

### Debug Mode
```dart
// Enable debug mode for testing
await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
```

## Troubleshooting

### Common Issues

1. **Service Not Running**
   - Check device battery optimization settings
   - Verify network connectivity
   - Check WorkManager permissions

2. **Data Not Updating**
   - Verify location permissions
   - Check API endpoint availability
   - Review error logs

3. **Battery Drain**
   - Adjust scheduling frequency
   - Modify network constraints
   - Review task execution time

### Debug Commands
```dart
// Check service status
final status = await ref.read(backgroundServiceNotifierProvider.notifier).getBackgroundServiceStatus();

// Manual fetch
await ref.read(backgroundServiceNotifierProvider.notifier).manuallyFetchPrayerTimings();

// Clear all tasks
await BackgroundPrayerService.cancelAllTasks();
```

## Future Enhancements

1. **Smart Scheduling**: Adaptive scheduling based on usage patterns
2. **Multi-Location Support**: Support for multiple saved locations
3. **Data Compression**: Compress stored data to save space
4. **Push Notifications**: Notify users of data updates
5. **Analytics**: Track background service performance and usage

## Security Considerations

1. **Location Privacy**: Location data is stored locally only
2. **Network Security**: Uses HTTPS for all API calls
3. **Data Integrity**: Validates all received data before storage
4. **Error Logging**: No sensitive data in error logs

## Platform Support

- **Android**: Full support with WorkManager
- **iOS**: Limited support (background execution restrictions)
- **Web**: Not supported (no background execution)
- **Desktop**: Limited support (no background execution)

The background service ensures that users always have access to prayer timing data, even when offline, while minimizing battery usage and network consumption. 