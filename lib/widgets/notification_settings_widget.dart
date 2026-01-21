import 'dart:developer' show log;
import 'dart:io';
import 'dart:math' show Random;

import 'package:adhan_app/model/prayer_timing_month_response_model.dart';
import 'package:adhan_app/utils/helper_functions.dart';
import 'package:adhan_app/utils/sound_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:adhan_app/services/notification_preferences_service.dart';
import 'package:adhan_app/services/notification_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:collection/collection.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

const _pagePadding = 16.0;

class NotificationSettingsWidget extends ConsumerStatefulWidget {
  const NotificationSettingsWidget({super.key, required this.prayerTiming});
  final List<Prayer> prayerTiming;

  @override
  ConsumerState<NotificationSettingsWidget> createState() =>
      _NotificationSettingsWidgetState();
}

class _NotificationSettingsWidgetState
    extends ConsumerState<NotificationSettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: NotificationPreferencesService.prayerNames.entries
          .where((entry) => entry.key != 'sunrise')
          .mapIndexed((index, entry) {
            final prayerTiming = widget.prayerTiming.firstWhere(
              (prayer) =>
                  StringUtils.equalsIgnoreCase(prayer.name?.name, entry.key),
            );

            final prayerKey = entry.key;
            final prayerName = entry.value;

            return HookConsumer(
              builder: (context, ref, _) {
                return ListTile(
                  key: Key('notification_setting_$prayerKey'),
                  onTap: () {
                    WoltModalSheet.show<void>(
                      context: context,
                      pageListBuilder: (modalSheetContext) {
                        final textTheme = Theme.of(context).textTheme;
                        return [
                          notificationSettingSideSheetPage(
                            prayerName,
                            textTheme,
                            modalSheetContext,
                            prayerKey,
                          ),

                          soundSettingSideSheetPage(
                            prayerName,
                            textTheme,
                            modalSheetContext,
                            prayerKey,
                          ),
                        ];
                      },

                      onModalDismissedWithBarrierTap: () {
                        debugPrint('Closed modal sheet with barrier tap');
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  title: HookConsumer(
                    builder: (context, ref, _) {
                      final dayPref = ref.watch(
                        specificNotificationPrefProvider(prayerKey),
                      );
                      return dayPref.when(
                        loading: () => SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(),
                        ),
                        error: (error, stackTrace) => Text('Error: ${error}'),
                        data: (isEnabled) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              prayerName,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: isEnabled
                                        ? Theme.of(
                                            context,
                                          ).colorScheme.onSurface
                                        : Colors.grey,
                                  ),
                            ),
                            Text(
                              DateFormat(
                                'h:mm a',
                              ).format(prayerTiming.time ?? DateTime.now()),
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: isEnabled
                                        ? Theme.of(
                                            context,
                                          ).colorScheme.onSurface
                                        : Colors.grey,
                                  ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  trailing: HookConsumer(
                    builder: (context, ref, _) {
                      final dayPref = ref.watch(
                        specificNotificationPrefProvider(prayerKey),
                      );
                      return dayPref.when(
                        loading: () => SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(),
                        ),
                        error: (error, stackTrace) => Text('Error: ${error}'),
                        data: (isEnabled) => Switch(
                          value: isEnabled,
                          onChanged: (value) async {
                            ref
                                .read(
                                  specificNotificationPrefProvider(
                                    prayerKey,
                                  ).notifier,
                                )
                                .toggleNotification(prayerKey, value);
                          },
                        ),
                      );
                    },
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                );
              },
            );
          })
          .toList(),
    );
  }

  SliverWoltModalSheetPage notificationSettingSideSheetPage(
    String prayerName,
    TextTheme textTheme,
    BuildContext modalSheetContext,
    String prayerKey,
  ) {
    return WoltModalSheetPage(
      hasSabGradient: false,
      topBarTitle: Text(prayerName, style: textTheme.titleSmall),
      isTopBarLayerAlwaysVisible: true,
      trailingNavBarWidget: IconButton(
        padding: const EdgeInsets.all(_pagePadding),
        icon: const Icon(Icons.close),
        onPressed: Navigator.of(modalSheetContext).pop,
      ),
      child: NotificationSettingMainSideSheetPage(prayerKey: prayerKey),
    );
  }

  SliverWoltModalSheetPage soundSettingSideSheetPage(
    String prayerName,
    TextTheme textTheme,
    BuildContext modalSheetContext,
    String prayerKey,
  ) {
    return WoltModalSheetPage(
      hasSabGradient: false,
      topBarTitle: Text(
        '$prayerName Sound Setting',
        style: textTheme.titleSmall,
      ),
      isTopBarLayerAlwaysVisible: true,
      leadingNavBarWidget: Padding(
        padding: const EdgeInsets.all(_pagePadding),
        child: BackButton(
          onPressed: () {
            WoltModalSheet.of(modalSheetContext).showPrevious();
          },
        ),
      ),
      trailingNavBarWidget: IconButton(
        padding: const EdgeInsets.all(_pagePadding),
        icon: const Icon(Icons.close),
        onPressed: Navigator.of(modalSheetContext).pop,
      ),
      child: SoundSettingSideSheetPage(prayerKey: prayerKey),
    );
  }
}

enum DayOfWeek {
  monday(abbreviation: 'Mon'),
  tuesday(abbreviation: 'Tue'),
  wednesday(abbreviation: 'Wed'),
  thursday(abbreviation: 'Thu'),
  friday(abbreviation: 'Fri'),
  saturday(abbreviation: 'Sat'),
  sunday(abbreviation: 'Sun');

  const DayOfWeek({required this.abbreviation});
  final String abbreviation;
}

class NotificationSettingMainSideSheetPage extends HookConsumerWidget {
  final String prayerKey;
  const NotificationSettingMainSideSheetPage({
    super.key,
    required this.prayerKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final soundPref = ref.watch(specificSoundPrefProvider(prayerKey));
    final notificationPref = ref.watch(
      specificNotificationPrefProvider(prayerKey),
    );
    return Padding(
      padding: const EdgeInsets.all(_pagePadding),
      child: HookConsumer(
        builder: (context, ref, _) {
          return notificationPref.when(
            error: (error, stackTrace) => Text('Error: $error'),
            loading: () => Center(child: CircularProgressIndicator()),
            data: (isEnabled) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                _daysWidget(isEnabled, prayerKey, context),
                HookConsumer(
                  builder: (context, ref, _) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      spacing: 8,
                      children: [
                        Expanded(
                          child: soundPref.when(
                            error: (e, st) => Text('Error: $e'),
                            loading: () => SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(),
                            ),
                            data: (sound) => _buildSoundSelector(
                              ref,
                              context,
                              prayerKey,
                              sound,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 8),
                _buildAdvanceTimeSelector(prayerKey),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _daysWidget(bool isEnabled, String prayerKey, BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Days',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        HookConsumer(
          builder: (context, ref, _) {
            final dayPrefs = ref.watch(specificDayPrefProvider(prayerKey));
            return dayPrefs.when(
              loading: () => SizedBox(
                height: 42,
                width: 42,
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) => Text('Error: ${error}'),
              data: (selectedDays) => Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: DayOfWeek.values
                    .map(
                      (day) => InkWell(
                        onTap: isEnabled
                            ? () async {
                                final newDays = {...selectedDays};

                                if (newDays.contains(day.abbreviation)) {
                                  newDays.remove(day.abbreviation);
                                } else {
                                  newDays.add(day.abbreviation);
                                }

                                ref
                                    .read(
                                      specificDayPrefProvider(
                                        prayerKey,
                                      ).notifier,
                                    )
                                    .setDayPref(prayerKey, newDays);
                              }
                            : null,

                        customBorder: RoundedSuperellipseBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DecoratedBox(
                          decoration: ShapeDecoration(
                            color:
                                selectedDays.contains(day.abbreviation) &&
                                    isEnabled
                                ? Theme.of(context).colorScheme.primary
                                : null,
                            shape: RoundedSuperellipseBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              side: BorderSide(
                                color: isEnabled
                                    ? selectedDays.contains(day.abbreviation)
                                          ? Theme.of(
                                              context,
                                            ).colorScheme.primary
                                          : Theme.of(
                                              context,
                                            ).colorScheme.onSurface
                                    : Colors.grey,
                              ),
                            ),
                          ),
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: Center(
                              child: Text(
                                day.abbreviation,
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(
                                      color: isEnabled
                                          ? (selectedDays.contains(
                                                  day.abbreviation,
                                                )
                                                ? Theme.of(
                                                    context,
                                                  ).colorScheme.onPrimary
                                                : Theme.of(
                                                    context,
                                                  ).colorScheme.onSurface)
                                          : Colors.grey,
                                      fontFeatures: const [
                                        FontFeature.tabularFigures(),
                                      ],
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSoundSelector(
    WidgetRef ref,
    BuildContext context,
    String prayerKey,
    String? currentSound,
  ) {
    return HookConsumer(
      builder: (context, ref, _) {
        final isLoadingAdhan = useState(false);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sound',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),

            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Notification Sound',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                AdhanAudioLibrary.values
                        .firstWhereOrNull((audio) => audio.url == currentSound)
                        ?.displayName ??
                    'Default',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(150),
                  fontWeight: FontWeight.w500,
                ),
              ),

              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                WoltModalSheet.of(context).showNext();
              },
            ),

            // Row(
            //   children: [
            //     Expanded(
            //       child: DropdownButtonFormField<AdhanAudioLibrary>(
            //         value: AdhanAudioLibrary.values.firstWhere(
            //           (audio) => audio.url == currentSound,
            //           orElse: () => AdhanAudioLibrary.defaultAdhan,
            //         ),
            //         decoration: const InputDecoration(
            //           border: OutlineInputBorder(),
            //           contentPadding: EdgeInsets.symmetric(
            //             horizontal: 8,
            //             vertical: 4,
            //           ),
            //           isDense: true,
            //         ),
            //         items: AdhanAudioLibrary.values.map((audio) {
            //           return DropdownMenuItem(
            //             value: audio,
            //             child: Text(
            //               audio.displayName,
            //               style: const TextStyle(fontSize: 12),
            //             ),
            //           );
            //         }).toList(),
            //         onChanged: (value) async {
            //           if (value == null) return;
            //           isLoadingAdhan.value = true;
            //           ref
            //               .read(specificSoundPrefProvider(prayerKey).notifier)
            //               .setSoundPref(prayerKey, value.url);

            //           await updatePrayerNotificationMethod(prayerKey, value.url)
            //               .catchError((error, stack) {
            //                 final er = error as DioException;
            //                 log(
            //                   'Error downloading sound: $error',
            //                   error: error,
            //                   stackTrace: stack,
            //                 );
            //                 if (!context.mounted) return;
            //                 ScaffoldMessenger.of(context).showSnackBar(
            //                   SnackBar(
            //                     content: Text(
            //                       'Error downloading sound: ${er.message}',
            //                     ),
            //                   ),
            //                 );
            //               })
            //               .whenComplete(() {
            //                 isLoadingAdhan.value = false;
            //               });
            //         },
            //       ),
            //     ),

            //     isLoadingAdhan.value
            //         ? const SizedBox(
            //             width: 24,
            //             height: 24,
            //             child: CircularProgressIndicator(strokeWidth: 2),
            //           )
            //         : IconButton(
            //             style: IconButton.styleFrom(
            //               foregroundColor: Theme.of(
            //                 context,
            //               ).colorScheme.onPrimaryContainer,
            //               padding: EdgeInsets.zero,
            //               visualDensity: VisualDensity.compact,
            //               tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            //             ),
            //             icon: const Icon(Icons.play_arrow),
            //             onPressed: () async {
            //               final sound = await ref.read(
            //                 specificSoundPrefProvider(prayerKey).future,
            //               );
            //               // _testNotification(context, prayerKey, sound);
            //             },
            //             tooltip: 'Test notification',
            //           ),
            //   ],
            // ),
          ],
        );
      },
    );
  }

  Widget _buildAdvanceTimeSelector(String prayerKey) {
    return HookConsumer(
      builder: (context, ref, _) {
        final advanceTime = ref.watch(
          specificAdvanceTimePrefProvider(prayerKey),
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Advance Time',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: advanceTime.when(
                    loading: () => SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(),
                    ),
                    error: (error, stackTrace) => Text('Error: $error'),
                    data: (advanceTime) => Slider(
                      value: advanceTime.toDouble(),
                      min: 0,
                      max: 30,
                      divisions: 6,
                      label: '${advanceTime} minutes',
                      onChanged: (value) async {
                        final rounded = value.round();
                        ref
                            .read(
                              specificAdvanceTimePrefProvider(
                                prayerKey,
                              ).notifier,
                            )
                            .setAdvanceTimePref(prayerKey, rounded);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    '${advanceTime.value}min',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  // Future<void> _testNotification(
  //   BuildContext context,
  //   String prayerName,
  //   String soundUrl,
  // ) async {
  //   try {
  //     await updatePrayerNotificationMethod(prayerName, soundUrl).catchError((
  //       e,
  //       s,
  //     ) {
  //       log(
  //         'Error updating prayer notification method: $e',
  //         error: e,
  //         stackTrace: s,
  //       );
  //       if (!context.mounted) return;
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Error updating prayer notification method: $e'),
  //         ),
  //       );
  //     });

  //     final prayer = Prayer(
  //       name: PrayerName.values.firstWhere((e) => e.lCase == prayerName),
  //       time: DateTime.now().add(const Duration(seconds: 2)),
  //     );

  //     await NotificationService.schedulePrayerNotification(
  //       id: Random().nextInt(100000),
  //       title: prayer.name!.displayName,
  //       body: 'Test notification for ${prayer.name?.displayName} prayer.',
  //       scheduledTime: prayer.time!,
  //       prayerName: prayerName,
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
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Error scheduling test notification: $e')),
  //       );
  //     }
  //   }
  // }

  // Future<void> updatePrayerNotificationMethod(
  //   String prayerName,
  //   String soundUrl,
  // ) async {
  //   try {
  //     final audio = AdhanAudioLibrary.values.firstWhere(
  //       (audio) => audio.url == soundUrl,
  //       orElse: () => AdhanAudioLibrary.defaultAdhan,
  //     );

  //     final filesDir = await getApplicationSupportDirectory();
  //     final dir = Directory('${filesDir.path}/adhan');

  //     if (!await dir.exists()) {
  //       await dir.create(recursive: true);
  //     }

  //     final existingFile = await findFileWithExtension(
  //       dir.path,
  //       '$prayerName.',
  //     );
  //     if (existingFile != null) {
  //       await existingFile.delete();
  //     }

  //     if (!audio.internal) {
  //       try {
  //         final newFileName = '$prayerName.${soundUrl.split('.').last}';
  //         await NotificationService.downloadSound(soundUrl, newFileName);
  //       } catch (e) {
  //         print('Failed to download sound for $prayerName: $e');
  //         rethrow;
  //       }
  //     }
  //   } catch (e) {
  //     print('Error updating prayer notification method for $prayerName: $e');
  //     rethrow;
  //   }
  // }
}



class SoundSettingSideSheetPage extends StatefulHookConsumerWidget {
  const SoundSettingSideSheetPage({super.key, required this.prayerKey});

  final String prayerKey;

  @override
  ConsumerState<SoundSettingSideSheetPage> createState() => _SoundSettingSideSheetPageState();
}

class _SoundSettingSideSheetPageState extends ConsumerState<SoundSettingSideSheetPage> {
  
  final player = AudioPlayer();

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }  
  
  @override
  Widget build(BuildContext context) {

    final soundPref = ref.watch(specificSoundPrefProvider(widget.prayerKey));
    final isLoadingAdhan = useState(false);
    return soundPref.when(
      error: (error, stackTrace) => Text('Error: $error'),
      loading: () => Center(child: CircularProgressIndicator()),
      data: (selectedSound) => Padding(
        padding: const EdgeInsets.all(_pagePadding),
        child: Column(
          children: AdhanAudioLibrary.values.map((audio) {
            final selectedAdhan = AdhanAudioLibrary.values.firstWhere(
                      (audio) => audio.url == selectedSound,
                      orElse: () => AdhanAudioLibrary.defaultAdhan,
                    );
            return ChoiceChip(
              showCheckmark: true,
              
              onSelected: (value) async {
                isLoadingAdhan.value = true;
                ref
                    .read(specificSoundPrefProvider(widget.prayerKey).notifier)
                    .setSoundPref(widget.prayerKey, audio.url);

                await updatePrayerNotificationMethod(widget.prayerKey, audio.url, player)
                    .catchError((error, stack) {
                      final er = error as DioException;
                      log(
                        'Error downloading sound: $error',
                        error: error,
                        stackTrace: stack,
                      );
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Error downloading sound: ${er.message}',
                          ),
                        ),
                      );
                    })
                    .whenComplete(() {
                      isLoadingAdhan.value = false;
                    });
              },
              label: Row(children: [Expanded(child: Text(audio.displayName)), 
                if (isLoadingAdhan.value && audio == selectedAdhan) 
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
              ],),
              selected: audio == selectedAdhan,
            );
          }).toList(),
        ),
      ),
    );
  }

  Future<void> updatePrayerNotificationMethod(
    String prayerName,
    String soundUrl, AudioPlayer player,
  ) async {
    try {
      if (player.playing) {
        await player.stop();
      }
      final audio = AdhanAudioLibrary.values.firstWhere(
        (audio) => audio.url == soundUrl,
        orElse: () => AdhanAudioLibrary.defaultAdhan,
      );

      final filesDir = await getApplicationSupportDirectory();
      final dir = Directory('${filesDir.path}/adhan');

      if (!await dir.exists()) {
        await dir.create(recursive: true);
      }

      final fileName = soundUrl.split('/').last;

      File? existingFile = await findFileWithExtension(
        dir.path,
        fileName,
      );

      if (!audio.internal) {
        try {
          if(existingFile == null) {
            existingFile = File(await NotificationService.downloadSound(soundUrl, fileName));
          }
          final newFileName = '$prayerName.${soundUrl.split('.').last}';
          await NotificationService.copyFile(fileName, newFileName);
          
          player.setFilePath(existingFile.path);
          player.play();
        } catch (e) {
          print('Failed to download sound for $prayerName: $e');
          rethrow;
        }
      }
    } catch (e) {
      print('Error updating prayer notification method for $prayerName: $e');
      rethrow;
    }
  }
}

