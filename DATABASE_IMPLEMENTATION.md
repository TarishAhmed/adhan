# Prayer Timing Database Implementation

This document describes the SQLite database implementation for caching prayer timing data in the Adhan app.

## Overview

The implementation uses SQLite to store prayer timing data locally, reducing API calls and improving app performance. The system automatically caches data and only makes API calls when necessary.

## Architecture

### 1. Database Service (`lib/services/prayer_database_service.dart`)
- Handles all SQLite operations
- Creates and manages database tables
- Provides methods for storing and retrieving prayer timing data
- Includes data validation and cleanup functionality

### 2. Data Manager (`lib/services/prayer_data_manager.dart`)
- High-level interface for prayer timing data operations
- Implements caching logic and data validation
- Handles API calls when cached data is not available
- Provides error handling and logging

### 3. Providers (`lib/providers/prayer_timing_provider.dart`)
- Riverpod providers that use the data manager
- Integrates with the existing app architecture
- Provides reactive data access for the UI

## Database Schema

### Prayer Timings Table
```sql
CREATE TABLE prayer_timings (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  year INTEGER NOT NULL,
  month INTEGER NOT NULL,
  day INTEGER NOT NULL,
  location_lat TEXT,
  location_lng TEXT,
  location_timezone TEXT,
  prayer_data TEXT NOT NULL,
  created_at INTEGER NOT NULL,
  UNIQUE(year, month, day, location_lat, location_lng)
)
```

### Location Info Table
```sql
CREATE TABLE location_info (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  lat TEXT NOT NULL,
  lng TEXT NOT NULL,
  timezone TEXT,
  last_updated INTEGER NOT NULL,
  UNIQUE(lat, lng)
)
```

## Key Features

### 1. Automatic Caching
- Data is automatically cached when fetched from API
- Cache is checked before making API calls
- Data validity is verified before using cached data

### 2. Location-Based Storage
- Data is stored per location (lat/lng combination)
- Supports multiple locations for the same user
- Location info is cached separately

### 3. Data Management
- Automatic cleanup of old data (older than 3 months)
- Manual data clearing options in settings
- Database statistics tracking

### 4. Error Handling
- Graceful fallback when database operations fail
- Comprehensive error logging
- API fallback when cache is unavailable

## Usage

### Basic Usage
```dart
// Get prayer timings for current month (with caching)
final prayerTimes = await PrayerDataManager.getPrayerTimingsForMonth(
  year: 2024,
  month: 1,
  lat: "40.7128",
  lng: "-74.0060",
  timezone: "America/New_York",
);

// Get prayer timing for specific date
final dayTiming = await PrayerDataManager.getPrayerTimingForDate(
  date: DateTime.now(),
  lat: "40.7128",
  lng: "-74.0060",
);
```

### Provider Usage
```dart
// In a Riverpod provider
final prayerTimes = await ref.watch(prayerTimeMonthNotifierProvider().future);

// Check if data exists
final hasData = await ref.watch(hasPrayerDataForCurrentMonthProvider.future);
```

## Settings Integration

The settings screen includes a "Database Management" section that provides:
- View database statistics (record counts)
- Clear old data (older than 3 months)
- Clear all cached data
- Real-time feedback on operations

## Performance Benefits

1. **Reduced API Calls**: Data is only fetched when not available locally
2. **Faster Loading**: Cached data loads instantly
3. **Offline Support**: App works with cached data when offline
4. **Bandwidth Savings**: Reduces data usage for users

## Data Flow

1. **First Request**: API call → Store in database → Return data
2. **Subsequent Requests**: Check database → Return cached data
3. **Data Expiry**: Check validity → API call if needed → Update cache
4. **Location Change**: Clear old location data → Fetch new location data

## Maintenance

### Automatic Cleanup
- Old data is automatically removed after 3 months
- Database size is managed automatically

### Manual Management
- Users can clear data through settings
- Database statistics are available for monitoring

## Error Scenarios

1. **Database Unavailable**: Falls back to API calls
2. **API Unavailable**: Uses cached data if available
3. **Invalid Data**: Automatically refreshes from API
4. **Location Change**: Clears old data and fetches new data

## Future Enhancements

1. **Background Sync**: Periodic data refresh in background
2. **Data Compression**: Compress stored JSON data
3. **Multi-Month Caching**: Cache multiple months at once
4. **Offline Mode**: Enhanced offline functionality
5. **Data Export/Import**: User data portability

## Testing

The implementation includes comprehensive error handling and logging for debugging:
- Database operation logs
- API call logs
- Cache hit/miss logs
- Error logging with stack traces 