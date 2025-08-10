/// Utilities for formatting geographic coordinates consistently across the app.
///
/// All coordinates are normalized to two decimal places for storage and
/// database key usage to reduce cache fragmentation while keeping ~1km precision.

/// Format a latitude or longitude to two decimal places.
String formatCoord(double value) => value.toStringAsFixed(2);

/// Convenience wrappers for clarity at call sites
String formatLatitude(double latitude) => formatCoord(latitude);
String formatLongitude(double longitude) => formatCoord(longitude);


