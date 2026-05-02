import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../l10n/gen/app_localizations.dart';
import '../providers/app_providers.dart';
import '../services/qibla_service.dart';
import '../theme/tokens.dart';
import '../widgets/qibla_compass_widget.dart';
import '../widgets/qibla_map_widget.dart';
import '../widgets/states/empty_state.dart';

/// Qibla compass screen, refreshed to match the M3 Expressive design language
/// of the rest of the app:
///   - clean app bar (no inversePrimary tint),
///   - design-token spacing/radii,
///   - reusable AppStateView for error / unsupported-sensor states,
///   - localized strings,
///   - light haptic on refresh.
class QiblaCompassScreen extends HookConsumerWidget {
  const QiblaCompassScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final location = ref.watch(locationProvider);

    final qiblaDirection = useState<double>(0.0);
    final distance = useState<double>(0.0);
    final deviceTiltDegrees = useState<double>(0.0);

    final compassStream = useMemoized(() => FlutterCompass.events);
    final compassSnapshot = useStream(compassStream);

    // Tilt sensor — used to surface "lay phone flat" feedback in calibration tips.
    final tiltSub = useMemoized<StreamSubscription<AccelerometerEvent>>(() {
      return accelerometerEventStream().listen((event) {
        const g = 9.81;
        final tilt = (90 - (event.z.abs() / g).clamp(0.0, 1.0) * 90).toDouble();
        deviceTiltDegrees.value = tilt;
      });
    });
    useEffect(() => tiltSub.cancel, [tiltSub]);

    Future<void> refresh() async {
      HapticFeedback.lightImpact();
      try {
        ref.invalidate(locationProvider);
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
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${l.errorLocationGeneric}: $e')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l.qiblaTitle),
        scrolledUnderElevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: l.commonRefresh,
            onPressed: refresh,
          ),
          const SizedBox(width: AppSpacing.sm),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              _CalibrationTips(tilt: deviceTiltDegrees.value),
              const SizedBox(height: AppSpacing.lg),
              location.when(
                loading: () => const Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.xxxl),
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (error, _) => AppStateView(
                  icon: Icons.location_off_outlined,
                  title: l.errorLocationGeneric,
                  description: error.toString(),
                  actionLabel: l.errorRetry,
                  onAction: refresh,
                ),
                data: (loc) {
                  if (!QiblaService.isCompassAvailable()) {
                    return AppStateView(
                      icon: Icons.explore_off_outlined,
                      title: l.qiblaError,
                      description: l.qiblaCompassUnavailable,
                      accent: theme.colorScheme.error,
                    );
                  }

                  final qiblaDir = QiblaService.calculateQiblaDirection(
                    loc.lat,
                    loc.lng,
                  );
                  final dist = QiblaService.calculateDistanceToKaaba(
                    loc.lat,
                    loc.lng,
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
                      if (compassSnapshot.connectionState ==
                          ConnectionState.waiting)
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: AppSpacing.xxxl,
                          ),
                          child: CircularProgressIndicator(),
                        )
                      else
                        QiblaCompassWidget(
                          compassAngle: compassAngle,
                          compassHeading: compassSnapshot.data?.heading ?? 0,
                          compassAccuracy: compassSnapshot.data?.accuracy,
                          qiblaDirection: qiblaDirection.value,
                          distance: distance.value,
                          isLoading: false,
                          errorMessage: compassSnapshot.hasError
                              ? compassSnapshot.error.toString()
                              : null,
                        ),
                      const SizedBox(height: AppSpacing.lg),
                      QiblaMapWidget(
                        latitude: loc.lat,
                        longitude: loc.lng,
                        qiblaBearingDegrees: qiblaDirection.value,
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}

class _CalibrationTips extends StatelessWidget {
  final double tilt;
  const _CalibrationTips({required this.tilt});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: AppRadius.allMd,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.tips_and_updates_outlined,
            color: theme.colorScheme.onPrimaryContainer,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l.qiblaCalibrationTitle,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  l.qiblaCalibrationBody(tilt.toStringAsFixed(0)),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
