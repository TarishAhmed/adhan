import 'package:adhan_app/providers/prayer_timing_provider.dart';
import 'package:adhan_app/utils/loader_messages.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/app_providers.dart';
import '../services/notification_service.dart';
import '../providers/notification_provider.dart';
import '../widgets/notification_settings_widget.dart';

class PrayerTimesScreen extends ConsumerWidget {
  const PrayerTimesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final theme = Theme.of(context);
    final locationAsync = ref.watch(locationProvider);
    final prayerTimesAsync = ref.watch(prayerTimeMonthNotifierProvider());

    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Handle the button press
      //     _testNotification(context);
      //   },
      //   child: const Icon(Icons.flight_takeoff_outlined),
      // ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: locationAsync.when(
          data: (location) => _PrayerAppBar(city: location.city ?? 'Custom'),
          loading: () => const _PrayerAppBar(city: '...'),
          error: (e, _) => _PrayerAppBar(city: 'Unknown'),
        ),
      ),
      body: locationAsync.when(
        loading: () => const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              LoaderMessage(child: Text('Fetching Location...')),
              CircularProgressIndicator(),
            ],
          ),
        ),
        error: (e, st) => Center(child: Text('Location error: $e')),
        data: (location) => prayerTimesAsync.when(
          loading: () => const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16,
              children: [
                LoaderMessage(child: Text('Fetching Prayer Times...')),
                CircularProgressIndicator(),
              ],
            ),
          ),
          error: (e, st) {
            print('Prayer times error: $e ${st.toString()}');
            return Center(child: Text('Prayer times error: $e'));
          },
          data: (prayerTimes) {
            final now = DateTime.now();

            final todaysPrayers = prayerTimes.multiDayTimings![now.day - 1];
            if (todaysPrayers.prayers == null) {
              return const Center(child: Text('No prayer times found'));
            }
            final timings = todaysPrayers.prayers!;

            // final currentRelevantPrayer = ref.watch(currentRelevantPrayerProvider);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),

                // Now → Next timeline with progress
                _PrayerTimeline(),
                const SizedBox(height: 32),

                // Notification Settings Widget
                Expanded(
                  child: NotificationSettingsWidget(prayerTiming: timings),
                ),

                const SizedBox(height: 16),

                // Expanded(
                //   child: ListView(
                //     padding: const EdgeInsets.symmetric(horizontal: 24),

                //     children:
                //         [
                //               if (timings[0].time != null)
                //                 PrayerTimeListItem(
                //                   PrayerTime(
                //                     time: timings[0].time!,
                //                     name: PrayerTimeName.fajr,
                //                   ),
                //                 ),
                //               if (timings[2].time != null)
                //                 PrayerTimeListItem(
                //                   PrayerTime(
                //                     time: timings[2].time!,
                //                     name: PrayerTimeName.Zuhr,
                //                   ),
                //                 ),
                //               if (timings[3].time != null)
                //                 PrayerTimeListItem(
                //                   PrayerTime(
                //                     time: timings[3].time!,
                //                     name: PrayerTimeName.asr,
                //                   ),
                //                 ),
                //               if (timings[5].time != null)
                //                 PrayerTimeListItem(
                //                   PrayerTime(
                //                     time: timings[5].time!,
                //                     name: PrayerTimeName.maghrib,
                //                   ),
                //                 ),
                //               if (timings[6].time != null)
                //                 PrayerTimeListItem(
                //                   PrayerTime(
                //                     time: timings[6].time!,
                //                     name: PrayerTimeName.isha,
                //                   ),
                //                 ),
                //             ]
                //             .expand(
                //               (widget) => [widget, const SizedBox(height: 12)],
                //             )
                //             .toList()
                //           ..removeLast(),
                //   ),
                // ),
              ],
            );
          },
        ),
      ),
    );
  }

  // Future<void> _testNotification(BuildContext context) async {
  //   final prayerName = 'fajr';

  //   final taskId = 'testNotifications';

  //   try {
  //     // final String? alarmUri = await _channel.invokeMethod<String>(
  //     //   'getAlarmUri',
  //     // );
  //     // print('alarm uri ${alarmUri}');

  //     final filesDir = await getApplicationSupportDirectory();
  //     final dir = Directory('${filesDir.path}/adhan');
  //     // print('alarm uri ${file.uri}');

  //     // return;

  //     if (!await dir.exists()) {
  //       final url = AdhanAudioLibrary.values.first.url;
  //       await NotificationService.downloadSound(url, '$prayerName.${url.split('.').last}');
  //     }

  //     final prayer = Prayer(
  //       name: Name.FAJR,
  //       time: DateTime.now().add(const Duration(seconds: 2)),
  //       audio: dir.path, // Use the local file path for testing
  //     );

  //     // await NotificationService.schedulePrayerNotification(
  //     //   id: Random().nextInt(100000),
  //     //   title: prayer.name!.displayName,
  //     //   body: 'Test notification for ${prayer.name?.displayName} prayer.',
  //     //   scheduledTime: prayer.time!,
  //     //   prayerName: 'fajr',
  //     // );

  //     await Workmanager().registerOneOffTask(
  //       taskId + Random().nextInt(100000).toString(),
  //       taskId,
  //       constraints: Constraints(
  //         networkType: NetworkType.connected,
  //         requiresBatteryNotLow: false,
  //         requiresCharging: false,
  //         requiresDeviceIdle: false,
  //         requiresStorageNotLow: false,
  //       ),
  //     );

  //     if (context.mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(
  //             'Test notification scheduled for ${prayer.time!.difference(DateTime.now()).inSeconds} seconds from now',
  //           ),
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     if (context.mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error scheduling test notification: $e')));
  //     }
  //   }
  // }
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
  const PrayerTimeListItem(this.prayerTime, {super.key});

  final PrayerTime prayerTime;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isNotified =
        ref.watch(prayerNotificationProvider)[prayerTime.name] ?? false;

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
                    prayerTime.name.displayName,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  Text(
                    DateFormat.jm().format(prayerTime.time),
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
                  final granted = await NotificationService.requestPermission(
                    context: context,
                  );
                  if (!granted) {
                    // Permission denied, revert toggle
                    ref
                        .read(prayerNotificationProvider.notifier)
                        .toggle(prayerTime.name, false);
                    return;
                  }
                }
                ref
                    .read(prayerNotificationProvider.notifier)
                    .toggle(prayerTime.name, value);

                if (value) {
                  await NotificationService.schedulePrayerNotification(
                    id: prayerTime.hashCode,
                    title: '${prayerTime.name.displayName} Prayer',
                    body:
                        'It\'s time for ${prayerTime.name.displayName} prayer.',
                    scheduledTime: prayerTime.time,
                    prayerName: prayerTime.name.name.toLowerCase(),
                  );
                } else {
                  await NotificationService.cancelPrayerNotification(
                    prayerTime.hashCode,
                  );
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

class _PrayerTimeline extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final timeline = ref.watch(prayerTimelineStreamProvider);
    return timeline.when(
      loading: () => const SizedBox.shrink(),
      error: (e, st) => const SizedBox.shrink(),
      data: (window) {
        if (window == null) return const SizedBox.shrink();
        final current = window.current;
        final next = window.next;
        final progress = (window.progress ?? 0).clamp(0.0, 1.0);
        final remaining = window.remaining;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(16),
          // decoration: BoxDecoration(
          //   color: theme.colorScheme.surfaceContainer,
          //   borderRadius: BorderRadius.circular(16),
          //   border: Border.all(
          //     color: theme.colorScheme.outline.withOpacity(0.2),
          //   ),
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      '${current.name.displayName}',
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  Icon(Icons.arrow_forward, size: 16),
                  Flexible(
                    child: Text(
                      '${next.name.displayName}',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              _SegmentedProgressBar(
                segments: window.segments,
                progress: progress,
              ),
              const SizedBox(height: 8),
              if (remaining != null)
                Text(
                  'Time remaining: ${formatPrayerOffset(remaining, isUpcoming: true)}',
                  style: theme.textTheme.bodySmall,
                ),
            ],
          ),
        );
      },
    );
  }
}

class _SegmentedProgressBar extends StatelessWidget {
  final List<ProgressSegment> segments;
  final double progress; // 0..1

  const _SegmentedProgressBar({required this.segments, required this.progress});

  Color _colorFor(PrayerUrgency urgency) {
    switch (urgency) {
      case PrayerUrgency.green:
        return Colors.green;
      case PrayerUrgency.yellow:
        return Colors.orange;
      case PrayerUrgency.red:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            return Stack(
              children: [
                // Grey base background
                Container(color: Colors.grey.shade300),
                // Foreground filled progress with rounded tip and per-segment colors
                Builder(
                  builder: (context) {
                    final filled = (progress * width).clamp(0.0, width);
                    if (filled <= 0) return const SizedBox.shrink();
                    return Stack(
                      children: [
                        // Draw each segment portion inside the filled width
                        ...segments.where((s) => s.start < progress).map((s) {
                          final segStart = s.start.clamp(0.0, progress);
                          final segEnd = s.end.clamp(0.0, progress);
                          final left = segStart * width;
                          final segW = (segEnd - segStart) * width;
                          final isRightEdge = segEnd >= progress - 1e-6;
                          return Positioned(
                            left: left,
                            top: 0,
                            bottom: 0,
                            width: segW,
                            child: Container(
                              decoration: BoxDecoration(
                                color: _colorFor(s.urgency),
                                borderRadius: isRightEdge
                                    ? const BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      )
                                    : BorderRadius.zero,
                              ),
                            ),
                          );
                        }),
                      ],
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class LoaderMessage extends StatelessWidget {
  final Widget? child;
  const LoaderMessage({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 6,
      children: [
        if (child != null) child!,
        Text(
          loaderMessages[DateTime.now().second % loaderMessages.length],
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
