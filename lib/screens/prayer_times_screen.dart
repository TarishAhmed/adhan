import 'package:adhan/model/prayer_time_response_model.dart';
import 'package:adhan/providers/prayer_timing_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/app_providers.dart';

class PrayerTimesScreen extends ConsumerWidget {
  const PrayerTimesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final locationAsync = ref.watch(locationProvider);
    final prayerTimesAsync = ref.watch(prayerTimingProvider());

    // Example current prayer and countdown (replace with real logic as needed)
    final String currentPrayer = 'Asr';
    final String countdown = '2 more hours till Asr';

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
        error: (e, st) {
          print('Location error: $e $st');
          return Center(child: Text('Location error: $e'));
        },
        data: (location) {
          return prayerTimesAsync.when(
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
                                    label: 'Fajr',
                                    time: timings.fajr!,
                                  ),
                                if (timings.dhuhr != null)
                                  PrayerTimeListItem(
                                    label: 'Duhr',
                                    time: timings.dhuhr!,
                                  ),
                                if (timings.asr != null)
                                  PrayerTimeListItem(
                                    label: 'Asr',
                                    time: timings.asr!,
                                  ),
                                if (timings.maghrib != null)
                                  PrayerTimeListItem(
                                    label: 'Maghrib',
                                    time: timings.maghrib!,
                                  ),
                                if (timings.isha != null)
                                  PrayerTimeListItem(
                                    label: 'Isha',
                                    time: timings.isha!,
                                  ),
                              ]
                              .expand(
                                (widget) => [
                                  widget,
                                  const SizedBox(height: 12),
                                ],
                              )
                              .toList()
                            ..removeLast(),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

String formatPrayerOffset(Duration offset, {required bool isUpcoming}) {
  print('offset: $offset');

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

class PrayerTimeListItem extends StatelessWidget {
  const PrayerTimeListItem({
    super.key,
    required this.label,
    required this.time,
  });

  final String label;
  final TimeOfDay time;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                    label,
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
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Coming soon'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              icon: Icon(
                // isMuted
                // ? Icons.notifications_off_outlined
                // :
                Icons.notifications_none_outlined,
              ),
              color: theme.colorScheme.primary,
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
          // IconButton(
          //   style: IconButton.styleFrom(
          //     foregroundColor: Theme.of(context).colorScheme.secondary,
          //   ),
          //   icon: const Icon(Icons.menu),
          //   onPressed: () {},
          // ),
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
