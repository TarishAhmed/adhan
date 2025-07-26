import 'dart:io';
import 'dart:math';

import 'package:adhan_app/model/prayer_timing_month_response_model.dart';
import 'package:adhan_app/providers/prayer_timing_provider.dart';
import 'package:adhan_app/utils/loader_messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:workmanager/workmanager.dart';
import '../providers/app_providers.dart';
import '../services/notification_service.dart';
import '../providers/notification_provider.dart';
import '../widgets/notification_settings_widget.dart';

class PrayerTimesScreen extends ConsumerWidget {
  const PrayerTimesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
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
            children: [LoaderMessage(child: Text('Fetching Location...')), CircularProgressIndicator()],
          ),
        ),
        error: (e, st) => Center(child: Text('Location error: $e')),
        data: (location) => prayerTimesAsync.when(
          loading: () => const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16,
              children: [LoaderMessage(child: Text('Fetching Prayer Times...')), CircularProgressIndicator()],
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

            final currentRelevantPrayer = ref.watch(currentRelevantPrayerProvider);
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
                            relevantPrayer?.prayer.name.displayName ?? 'No Data',
                            style: theme.textTheme.displaySmall?.copyWith(color: theme.colorScheme.primary),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            relevantPrayer?.offset != null
                                ? formatPrayerOffset(relevantPrayer!.offset, isUpcoming: true)
                                : 'Unable to fetch data',
                            style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.secondary),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  loading: () => const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 16,
                      children: [LoaderMessage(child: Text('Fetching Upcoming Prayer...')), CircularProgressIndicator()],
                    ),
                  ),
                  error: (e, st) {
                    print('Error: $e ${st.toString()} ');
                    return Center(child: Text('Error: $e'));
                  },
                ),
                const SizedBox(height: 32),

                // Notification Settings Widget
                Expanded(child: NotificationSettingsWidget(prayerTiming: timings)),

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

  Future<void> _testNotification(BuildContext context) async {
    final prayerName = 'fajr';

    final taskId = 'testNotifications';

    try {
      // final String? alarmUri = await _channel.invokeMethod<String>(
      //   'getAlarmUri',
      // );
      // print('alarm uri ${alarmUri}');

      final filesDir = await getApplicationSupportDirectory();
      final dir = Directory('${filesDir.path}/adhan');
      // print('alarm uri ${file.uri}');

      // return;

      if (!await dir.exists()) {
        final url = "https://cdn.aladhan.com/audio/adhans/a1.mp3";
        await NotificationService.downloadSound(url, '$prayerName.${url.split('.').last}');
      }

      final prayer = Prayer(
        name: Name.FAJR,
        time: DateTime.now().add(const Duration(seconds: 2)),
        audio: dir.path, // Use the local file path for testing
      );

      // await NotificationService.schedulePrayerNotification(
      //   id: Random().nextInt(100000),
      //   title: prayer.name!.displayName,
      //   body: 'Test notification for ${prayer.name?.displayName} prayer.',
      //   scheduledTime: prayer.time!,
      //   prayerName: 'fajr',
      // );

      await Workmanager().registerOneOffTask(
        taskId + Random().nextInt(100000).toString(),
        taskId,
        constraints: Constraints(
          networkType: NetworkType.connected,
          requiresBatteryNotLow: false,
          requiresCharging: false,
          requiresDeviceIdle: false,
          requiresStorageNotLow: false,
        ),
      );

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Test notification scheduled for ${prayer.time!.difference(DateTime.now()).inSeconds} seconds from now',
            ),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error scheduling test notification: $e')));
      }
    }
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
  const PrayerTimeListItem(this.prayerTime, {super.key});

  final PrayerTime prayerTime;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isNotified = ref.watch(prayerNotificationProvider)[prayerTime.name] ?? false;

    return DecoratedBox(
      decoration: BoxDecoration(color: theme.colorScheme.surfaceContainer, borderRadius: BorderRadius.circular(16)),
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
                    style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.primary),
                  ),
                  Text(
                    DateFormat.jm().format(prayerTime.time),
                    style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.secondary),
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
                    ref.read(prayerNotificationProvider.notifier).toggle(prayerTime.name, false);
                    return;
                  }
                }
                ref.read(prayerNotificationProvider.notifier).toggle(prayerTime.name, value);

                if (value) {
                  await NotificationService.schedulePrayerNotification(
                    id: prayerTime.hashCode,
                    title: '${prayerTime.name.displayName} Prayer',
                    body: 'It\'s time for ${prayerTime.name.displayName} prayer.',
                    scheduledTime: prayerTime.time,
                    prayerName: prayerTime.name.name.toLowerCase(),
                  );
                } else {
                  await NotificationService.cancelPrayerNotification(prayerTime.hashCode);
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
        Text(loaderMessages[DateTime.now().second % loaderMessages.length], textAlign: TextAlign.center),
      ],
    );
  }
}
