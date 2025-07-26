import 'package:adhan_app/screens/prayer_times_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../services/qibla_service.dart';

class QiblaCompassWidget extends StatelessWidget {
  final double compassAngle;
  final double compassHeading;
  final double? compassAccuracy;
  final double qiblaDirection;
  final double distance;
  final bool isLoading;
  final String? errorMessage;

  const QiblaCompassWidget({
    super.key,
    required this.compassAngle,
    required this.compassHeading,
    this.compassAccuracy,
    required this.qiblaDirection,
    required this.distance,
    required this.isLoading,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            LoaderMessage(child: Text('Getting location and compass data...')),
          ],
        ),
      );
    }

    if (errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text('Error', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(
              errorMessage!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Compass Container with RepaintBoundary for performance
        RepaintBoundary(
          child: Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Compass background with rotation
                RepaintBoundary(
                  child: Transform.rotate(
                    angle:
                        -(compassHeading * math.pi) /
                        180, // Negative to counter-rotate
                    child: Container(
                      width: 260,
                      height: 260,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  ),
                ),

                // Direction markers with rotation
                RepaintBoundary(
                  child: Transform.rotate(
                    angle:
                        -(compassHeading * math.pi) /
                        180, // Negative to counter-rotate
                    child: Stack(
                      children: [
                        ...List.generate(8, (index) {
                          double angle = index * 45.0;
                          double radius = 120.0;
                          double rad =
                              (angle - 90) *
                              math.pi /
                              180; // -90 to start from top
                          double x = radius * math.cos(rad);
                          double y = radius * math.sin(rad);
                          return Positioned(
                            left:
                                140 +
                                x -
                                14, // 140 is center, 14 is half text width
                            top: 140 + y - 10, // 10 is half text height
                            child: Text(
                              _getDirectionLabel(angle),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          );
                        }),
                        // Kaaba dot on the same circle
                        Builder(
                          builder: (context) {
                            double radius = 120.0;
                            double rad =
                                (qiblaDirection - 90) *
                                math.pi /
                                180; // -90 to start from top
                            double x = radius * math.cos(rad);
                            double y = radius * math.sin(rad);
                            return Positioned(
                              left:
                                  140 +
                                  x -
                                  15, // 140 is center, 15 is half icon width
                              top: 140 + y - 15, // 15 is half icon height
                              child: Transform.rotate(
                                angle:
                                    (compassHeading * math.pi) /
                                    180, // Counter-rotate to keep emoji upright
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Text(
                                      '🕋',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // Fixed red needle (always pointing north)
                RepaintBoundary(
                  child: Container(
                    width: 4,
                    height: 120,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          _getNeedleColor(),
                          _getNeedleColor().withOpacity(0.7),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),

                // Center dot
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primary,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.surface,
                      width: 3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 32),

        // Information cards
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Compass heading
              _buildInfoCard(
                context,
                'Compass Heading',
                '${compassHeading.toStringAsFixed(1)}°',
                Icons.explore,
              ),
              const SizedBox(height: 12),

              // Compass accuracy
              if (compassAccuracy != null)
                _buildInfoCard(
                  context,
                  'Compass Accuracy',
                  QiblaService.getCompassAccuracyLevel(compassAccuracy),
                  Icons.sensors,
                ),
              if (compassAccuracy != null) const SizedBox(height: 12),

              // Qibla direction
              _buildInfoCard(
                context,
                'Qibla Direction',
                '${qiblaDirection.toStringAsFixed(1)}°',
                Icons.navigation,
              ),
              const SizedBox(height: 12),

              // Distance to Kaaba
              _buildInfoCard(
                context,
                'Distance to Kaaba',
                '${distance.toStringAsFixed(0)} km',
                Icons.straighten,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getDirectionLabel(double angle) {
    if (angle == 0) return 'N';
    if (angle == 45) return 'NE';
    if (angle == 90) return 'E';
    if (angle == 135) return 'SE';
    if (angle == 180) return 'S';
    if (angle == 225) return 'SW';
    if (angle == 270) return 'W';
    if (angle == 315) return 'NW';
    return '';
  }

  Color _getNeedleColor() {
    // Calculate the shortest angular distance between compass heading and qibla direction
    // This method properly handles the circular nature of angles
    double angleDifference = (qiblaDirection - compassHeading).abs();

    // Normalize to 0-180 degrees (since we care about the shortest angle)
    if (angleDifference > 180) {
      angleDifference = 360 - angleDifference;
    }

    // Alternative method: use the minimum of clockwise and counterclockwise distances
    double clockwiseDistance = (qiblaDirection - compassHeading + 360) % 360;
    double counterclockwiseDistance =
        (compassHeading - qiblaDirection + 360) % 360;
    double shortestDistance = clockwiseDistance < counterclockwiseDistance
        ? clockwiseDistance
        : counterclockwiseDistance;

    // Use the shortest distance for color calculation
    const double greenThreshold = 15.0;
    const double yellowThreshold = 60.0;

    if (shortestDistance <= greenThreshold) {
      return Colors.green;
    } else if (shortestDistance <= yellowThreshold) {
      double ratio =
          (shortestDistance - greenThreshold) /
          (yellowThreshold - greenThreshold);
      return Color.lerp(Colors.green, Colors.orange, ratio)!;
    } else {
      double ratio =
          (shortestDistance - yellowThreshold) / (180.0 - yellowThreshold);
      return Color.lerp(Colors.orange, Colors.red, ratio)!;
    }
  }
}
