# Qibla Compass Implementation

## Overview

The Qibla Compass feature has been implemented to help users find the direction to the Kaaba (21.4225° N, 39.8262° E) for prayer. The implementation uses the device's GPS and compass sensors to provide accurate directional guidance.

## Features

- **Real-time compass**: Uses device's magnetometer and accelerometer sensors
- **GPS integration**: Gets current location to calculate qibla direction
- **Visual compass**: Beautiful circular compass with rotating needle
- **Accuracy indicators**: Shows compass accuracy level
- **Distance calculation**: Displays distance to Kaaba
- **Error handling**: Graceful handling of sensor unavailability and permission issues

## Technical Implementation

### Dependencies Added

```yaml
flutter_compass: ^0.8.0
```

### Key Components

1. **QiblaService** (`lib/services/qibla_service.dart`)
   - Calculates qibla direction using spherical trigonometry
   - Handles location permissions and GPS access
   - Provides compass availability checking
   - Includes utility functions for coordinate validation and direction names

2. **QiblaCompassWidget** (`lib/widgets/qibla_compass_widget.dart`)
   - Custom compass UI with rotating needle
   - Displays compass heading, qibla direction, and distance
   - Shows compass accuracy level
   - Handles loading and error states

3. **QiblaCompassScreen** (`lib/screens/qibla_compass_screen.dart`)
   - Main screen that integrates all components
   - Manages sensor streams and state
   - Provides refresh functionality
   - Shows location information

### Permissions Required

#### Android (`android/app/src/main/AndroidManifest.xml`)
```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.HIGH_SAMPLING_RATE_SENSORS" />
<uses-feature android:name="android.hardware.sensor.accelerometer" android:required="true" />
<uses-feature android:name="android.hardware.sensor.magnetometer" android:required="true" />
```

#### iOS (`ios/Runner/Info.plist`)
```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>This app needs access to location to determine the direction to the Kaaba for prayer times.</string>
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>This app needs access to location to determine the direction to the Kaaba for prayer times.</string>
```

## How It Works

1. **Location Detection**: The app requests GPS permission and gets the user's current coordinates
2. **Qibla Calculation**: Using spherical trigonometry, it calculates the bearing from the user's location to the Kaaba
3. **Compass Integration**: The device's compass sensor provides real-time heading data
4. **Angle Calculation**: The difference between compass heading and qibla direction determines the needle rotation
5. **Visual Feedback**: A red needle points toward a green dot representing the Kaaba direction

## Usage Instructions

1. **Hold device flat**: Keep the device parallel to the ground
2. **Rotate slowly**: Turn the device until the red needle points to the green dot
3. **Check accuracy**: Monitor the compass accuracy indicator for best results
4. **Refresh if needed**: Use the refresh button to update location data

## Mathematical Formula

The qibla direction is calculated using the spherical trigonometry formula:

```
bearing = atan2(sin(Δλ) * cos(φ2), cos(φ1) * sin(φ2) - sin(φ1) * cos(φ2) * cos(Δλ))
```

Where:
- φ1, λ1 = User's latitude and longitude
- φ2, λ2 = Kaaba's latitude and longitude (21.4225° N, 39.8262° E)
- Δλ = Difference in longitude

## Testing

The implementation includes comprehensive tests (`test/qibla_service_test.dart`) that verify:
- Qibla direction calculations for known locations
- Distance calculations
- Coordinate validation
- Compass angle calculations
- Direction name mapping
- Accuracy level determination

## Error Handling

The app gracefully handles various error scenarios:
- **No GPS permission**: Shows permission request dialog
- **Compass unavailable**: Displays appropriate error message
- **Location services disabled**: Guides user to enable location
- **Poor accuracy**: Shows accuracy level indicator

## Future Enhancements

Potential improvements could include:
- Magnetic declination correction
- Calibration guidance for better accuracy
- Offline mode with cached location data
- Multiple qibla calculation methods
- Augmented reality overlay
- Prayer time integration with qibla direction

## Troubleshooting

### Common Issues

1. **Compass not working**: Ensure device has magnetometer sensor
2. **Inaccurate readings**: Calibrate compass by moving device in figure-8 pattern
3. **Location errors**: Check GPS permissions and signal strength
4. **Needle not moving**: Verify device is held flat and rotated slowly

### Device Compatibility

- Requires GPS and magnetometer sensors
- Works on Android 6.0+ and iOS 10.0+
- Best accuracy on devices with high-quality sensors 