import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:async';
import '../services/qibla_service.dart';
import '../widgets/qibla_compass_widget.dart';

class QiblaCompassScreen extends HookConsumerWidget {
  const QiblaCompassScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final compassHeading = useState<double>(0.0);
    final compassAccuracy = useState<double?>(null);
    final qiblaDirection = useState<double>(0.0);
    final distance = useState<double>(0.0);
    final isLoading = useState<bool>(true);
    final errorMessage = useState<String?>(null);
    final currentPosition = useState<Position?>(null);
    final isCompassAvailable = useState<bool>(false);
    final compassSubscription = useState<StreamSubscription<CompassEvent>?>(
      null,
    );

    // Initialize compass and location
    useEffect(() {
      bool isMounted = true;

      Future<void> initializeCompass() async {
        try {
          // Check compass availability first
          final compassAvailable = await QiblaService.isCompassAvailable();
          if (!isMounted) return;

          isCompassAvailable.value = compassAvailable;

          if (!compassAvailable) {
            isLoading.value = false;
            errorMessage.value = 'Compass sensor not available on this device.';
            return;
          }

          // Get current location first
          final position = await QiblaService.getCurrentLocation();
          if (!isMounted) return;

          if (position == null) {
            isLoading.value = false;
            errorMessage.value =
                'Unable to get location. Please enable location services and grant permission.';
            return;
          }

          currentPosition.value = position;

          // Calculate qibla direction and distance
          final qiblaDir = QiblaService.calculateQiblaDirection(
            position.latitude,
            position.longitude,
          );
          final dist = QiblaService.calculateDistanceToKaaba(
            position.latitude,
            position.longitude,
          );

          if (isMounted) {
            qiblaDirection.value = qiblaDir;
            distance.value = dist;
          }

          // Start compass stream with throttling for 60 FPS
          final subscription = FlutterCompass.events?.listen(
            (event) {
              if (!isMounted) return;

              if (event.heading != null) {
                compassHeading.value = event.heading!;
              }
              if (event.accuracy != null) {
                compassAccuracy.value = event.accuracy!;
              }
            },
            onError: (error) {
              if (isMounted) {
                errorMessage.value = 'Compass error: ${error.toString()}';
              }
            },
          );

          if (isMounted) {
            compassSubscription.value = subscription;
            isLoading.value = false;
          }
        } catch (e) {
          if (isMounted) {
            isLoading.value = false;
            errorMessage.value = 'Error initializing compass: ${e.toString()}';
          }
        }
      }

      initializeCompass();

      return () {
        isMounted = false;
        compassSubscription.value?.cancel();
      };
    }, []);

    // Calculate compass angle
    final compassAngle = QiblaService.calculateCompassAngle(
      compassHeading.value,
      qiblaDirection.value,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Qibla Compass'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async {
              isLoading.value = true;
              errorMessage.value = null;

              try {
                final position = await QiblaService.getCurrentLocation();
                if (position != null) {
                  currentPosition.value = position;
                  qiblaDirection.value = QiblaService.calculateQiblaDirection(
                    position.latitude,
                    position.longitude,
                  );
                  distance.value = QiblaService.calculateDistanceToKaaba(
                    position.latitude,
                    position.longitude,
                  );
                } else {
                  errorMessage.value =
                      'Unable to get location. Please enable location services and grant permission.';
                }
              } catch (e) {
                errorMessage.value = 'Error refreshing: ${e.toString()}';
              } finally {
                isLoading.value = false;
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              // Instructions
              // if (!isLoading.value && errorMessage.value == null)
              //   Container(
              //     width: double.infinity,
              //     padding: const EdgeInsets.all(16),
              //     margin: const EdgeInsets.only(bottom: 16),
              //     decoration: BoxDecoration(
              //       color: Theme.of(context).colorScheme.primaryContainer,
              //       borderRadius: BorderRadius.circular(12),
              //     ),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Row(
              //           children: [
              //             Icon(
              //               Icons.info_outline,
              //               color: Theme.of(
              //                 context,
              //               ).colorScheme.onPrimaryContainer,
              //             ),
              //             const SizedBox(width: 8),
              //             Text(
              //               'Instructions',
              //               style: Theme.of(context).textTheme.titleMedium
              //                   ?.copyWith(
              //                     fontWeight: FontWeight.bold,
              //                     color: Theme.of(
              //                       context,
              //                     ).colorScheme.onPrimaryContainer,
              //                   ),
              //             ),
              //           ],
              //         ),
              //         const SizedBox(height: 8),
              //         Text(
              //           'Hold your device flat and rotate it until the red needle points to the green dot. The green dot represents the direction to the Kaaba.',
              //           style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              //             color: Theme.of(
              //               context,
              //             ).colorScheme.onPrimaryContainer,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),

              // Compass Widget
              QiblaCompassWidget(
                compassAngle: compassAngle,
                compassHeading: compassHeading.value,
                compassAccuracy: compassAccuracy.value,
                qiblaDirection: qiblaDirection.value,
                distance: distance.value,
                isLoading: isLoading.value,
                errorMessage: errorMessage.value,
              ),

              // Additional information
              // if (!isLoading.value &&
              //     errorMessage.value == null &&
              //     currentPosition.value != null)
              //   Container(
              //     width: double.infinity,
              //     padding: const EdgeInsets.all(16),
              //     margin: const EdgeInsets.only(top: 16),
              //     decoration: BoxDecoration(
              //       color: Theme.of(context).colorScheme.surface,
              //       borderRadius: BorderRadius.circular(12),
              //       border: Border.all(
              //         color: Theme.of(
              //           context,
              //         ).colorScheme.outline.withOpacity(0.2),
              //       ),
              //     ),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           'Location Information',
              //           style: Theme.of(context).textTheme.titleMedium
              //               ?.copyWith(fontWeight: FontWeight.bold),
              //         ),
              //         const SizedBox(height: 12),
              //         _buildLocationInfo(
              //           context,
              //           'Your Location',
              //           '${currentPosition.value!.latitude.toStringAsFixed(4)}°N, ${currentPosition.value!.longitude.toStringAsFixed(4)}°E',
              //           Icons.my_location,
              //         ),
              //         const SizedBox(height: 8),
              //         _buildLocationInfo(
              //           context,
              //           'Kaaba Location',
              //           '${QiblaService.kaabaLatitude}°N, ${QiblaService.kaabaLongitude}°E',
              //           Icons.location_on,
              //         ),
              //       ],
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationInfo(
    BuildContext context,
    String title,
    String value,
    IconData icon,
  ) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 8),
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
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
