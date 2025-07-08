import 'package:adhan/providers/prayer_timing_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/app_providers.dart';
import '../services/notification_service.dart';
import '../providers/notification_provider.dart';

class PrayerTimesScreen extends ConsumerWidget {
  const PrayerTimesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final locationAsync = ref.watch(locationProvider);
    final prayerTimesAsync = ref.watch(prayerTimingProvider());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: locationAsync.when(
          data: (location) => _PrayerAppBar(city: location.city ?? 'Custom'),
          loading: () => const _PrayerAppBar(city: '...'),
          error: (e, _) => _PrayerAppBar(city: 'Unknown'),
        ),
      ),
      body: locationAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Location error: $e')),
        data: (location) => prayerTimesAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Prayer times error: $e')),
          data: (prayerTimes) {
            if (prayerTimes.data?.timings == null) {
              return const Center(child: Text('No prayer times found'));
            }
            final timings = prayerTimes.data!.timings!;
            final currentRelevantPrayer = ref.watch(
              currentRelevantPrayerProvider,
            );
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                currentRelevantPrayer.when(
                  data: (relevantPrayer) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            relevantPrayer.prayer.name.displayName,
                            style: theme.textTheme.displaySmall?.copyWith(
                              color: theme.colorScheme.primary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            formatPrayerOffset(
                              relevantPrayer.offset,
                              isUpcoming: true,
                            ),
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: theme.colorScheme.secondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, _) => Center(child: Text('Error: $e')),
                ),
                const SizedBox(height: 32),

                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),

                    children:
                        [
                              if (timings.fajr != null)
                                PrayerTimeListItem(
                                  prayer: PrayerTimeName.fajr,
                                  time: timings.fajr!,
                                ),
                              if (timings.dhuhr != null)
                                PrayerTimeListItem(
                                  prayer: PrayerTimeName.dhuhr,
                                  time: timings.dhuhr!,
                                ),
                              if (timings.asr != null)
                                PrayerTimeListItem(
                                  prayer: PrayerTimeName.asr,
                                  time: timings.asr!,
                                ),
                              if (timings.maghrib != null)
                                PrayerTimeListItem(
                                  prayer: PrayerTimeName.maghrib,
                                  time: timings.maghrib!,
                                ),
                              if (timings.isha != null)
                                PrayerTimeListItem(
                                  prayer: PrayerTimeName.isha,
                                  time: timings.isha!,
                                ),
                            ]
                            .expand(
                              (widget) => [widget, const SizedBox(height: 12)],
                            )
                            .toList()
                          ..removeLast(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () async {
            final now = DateTime.now();
            final testTime = now.add(const Duration(seconds: 5));
            await NotificationService.schedulePrayerNotification(
              id: 99999,
              title: '${PrayerTimeName.dhuhr.displayName} Prayer',
              body: 'It\'s time for ${PrayerTimeName.dhuhr.displayName} prayer.',
              scheduledTime: testTime,
              sound: AdhanSound.misharyRashidAlafasy,
            );
          },
          child: const Text('Test Notification'),
        ),
      ),
    );
  }
}

String formatPrayerOffset(Duration offset, {required bool isUpcoming}) {
  final totalMinutes = offset.inMinutes.abs();
  final hours = totalMinutes ~/ 60;
  final minutes = totalMinutes % 60;

  if (totalMinutes == 0) return "just now";

  final parts = <String>[];
  if (hours > 0) parts.add('$hours hour${hours > 1 ? 's' : ''}');
  if (minutes > 0) parts.add('$minutes minute${minutes > 1 ? 's' : ''}');

  final phrase = parts.join(' ');

  return isUpcoming ? 'in $phrase' : '$phrase ago';
}

class PrayerTimeListItem extends ConsumerWidget {
  const PrayerTimeListItem({
    super.key,
    required this.prayer,
    required this.time,
  });

  final PrayerTimeName prayer;
  final TimeOfDay time;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isNotified = ref.watch(prayerNotificationProvider)[prayer] ?? false;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    prayer.displayName,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  Text(
                    time.format(context),
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
            Switch(
              value: isNotified,
              onChanged: (value) async {
                if (value) {
                  final granted = await NotificationService.requestPermission(context: context);
                  if (!granted) {
                    // Permission denied, revert toggle
                    ref.read(prayerNotificationProvider.notifier).toggle(prayer, false);
                    return;
                  }
                }
                ref.read(prayerNotificationProvider.notifier).toggle(prayer, value);
                final now = DateTime.now();
                final scheduledTime = DateTime(
                  now.year,
                  now.month,
                  time.hour,
                  time.minute,
                );
                if (value) {
                  await NotificationService.schedulePrayerNotification(
                    id: prayer.hashCode,
                    title: '${prayer.displayName} Prayer',
                    body: 'It\'s time for ${prayer.displayName} prayer.',
                    scheduledTime: scheduledTime,
                    sound: AdhanSound.defaultRingtone,
                  );
                } else {
                  await NotificationService.cancelPrayerNotification(prayer.hashCode);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _PrayerAppBar extends StatelessWidget {
  final String city;
  const _PrayerAppBar({required this.city});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton.icon(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              textStyle: Theme.of(context).textTheme.titleMedium,
              iconSize: 24,
              foregroundColor: Theme.of(context).colorScheme.secondary,
            ),
            iconAlignment: IconAlignment.end,
            onPressed: () {},
            label: Text(city),
            icon: const Icon(Icons.location_on_outlined),
          ),
        ],
      ),
    );
  }
}
