import 'package:adhan_app/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:async';
import 'package:sensors_plus/sensors_plus.dart';
import '../widgets/qibla_map_widget.dart';
import '../services/qibla_service.dart';
import '../widgets/qibla_compass_widget.dart';

class QiblaCompassScreen extends HookConsumerWidget {
  const QiblaCompassScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qiblaDirection = useState<double>(0.0);
    final distance = useState<double>(0.0);
    final location = ref.watch(locationProvider);

    final deviceTiltDegrees = useState<double>(0.0);

    final compassStream = useMemoized(() => FlutterCompass.events);

    final compassSnapshot = useStream(compassStream);

    final tiltSub = useMemoized<StreamSubscription<AccelerometerEvent>>(() {
      return accelerometerEventStream().listen((event) {
        // Compute tilt from Z axis assuming device flat when z ~ 9.8
        final g = 9.81;
        final z = event.z;
        final tilt = (90 - (z.abs() / g).clamp(0.0, 1.0) * 90).toDouble();
        deviceTiltDegrees.value = tilt;
      });
    });

    useEffect(() {
      return tiltSub.cancel;
    }, [tiltSub]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Qibla Compass'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async {
              try {
                final position = await ref.read(locationProvider.future);
                qiblaDirection.value = QiblaService.calculateQiblaDirection(
                  position.lat,
                  position.lng,
                );
                distance.value = QiblaService.calculateDistanceToKaaba(
                  position.lat,
                  position.lng,
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error refreshing location: $e')),
                );
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
              // Calibration tips
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.tips_and_updates_outlined,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Calibration tips',
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimaryContainer,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Move phone in a figure-8 motion, away from metal or magnets. Place it flat. Tilt: ${deviceTiltDegrees.value.toStringAsFixed(0)}°',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimaryContainer,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Compass Widget
              location.when(
                error: (error, stackTrace) => Text(
                  'Location error: ${error.toString()}',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
                loading: () => const CircularProgressIndicator(),
                data: (location) {
                  final compassAvailable = QiblaService.isCompassAvailable();
                  if (!compassAvailable) {
                    return Text(
                      'Compass sensor not available on this device.',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    );
                  }

                  // Calculate qibla direction and distance
                  final qiblaDir = QiblaService.calculateQiblaDirection(
                    location.lat,
                    location.lng,
                  );
                  final dist = QiblaService.calculateDistanceToKaaba(
                    location.lat,
                    location.lng,
                  );

                  qiblaDirection.value = qiblaDir;
                  distance.value = dist;

                  final compassAngle = QiblaService.calculateCompassAngle(
                    compassSnapshot.data?.heading ?? 0,
                    qiblaDirection.value,
                  );

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      compassSnapshot.connectionState == ConnectionState.waiting
                          ? const CircularProgressIndicator()
                          : QiblaCompassWidget(
                              compassAngle: compassAngle,
                              compassHeading:
                                  compassSnapshot.data?.heading ?? 0,
                              compassAccuracy: compassSnapshot.data?.accuracy,
                              qiblaDirection: qiblaDirection.value,
                              distance: distance.value,
                              isLoading: false,
                              errorMessage: compassSnapshot.hasError
                                  ? compassSnapshot.error.toString()
                                  : null,
                            ),

                      const SizedBox(height: 16),
                      QiblaMapWidget(
                        latitude: location.lat,
                        longitude: location.lng,
                        qiblaBearingDegrees: qiblaDirection.value,
                      ),
                    ],
                  );
                },
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

  // Removed unused helper _buildLocationInfo
}
