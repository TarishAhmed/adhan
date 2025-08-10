import 'dart:developer' show log;
import 'dart:io';
import 'dart:math' show Random;

import 'package:adhan_app/model/prayer_timing_month_response_model.dart';
import 'package:adhan_app/utils/helper_functions.dart';
import 'package:adhan_app/utils/sound_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adhan_app/services/notification_preferences_service.dart';
import 'package:adhan_app/services/notification_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:collection/collection.dart';

class NotificationSettingsWidget extends ConsumerStatefulWidget {
  const NotificationSettingsWidget({super.key, required this.prayerTiming});
  final List<Prayer> prayerTiming;

  @override
  ConsumerState<NotificationSettingsWidget> createState() =>
      _NotificationSettingsWidgetState();
}

class _NotificationSettingsWidgetState
    extends ConsumerState<NotificationSettingsWidget> {
  Map<String, bool> _notificationPreferences = {};
  Map<String, String> _soundPreferences = {};
  Map<String, int> _advanceTimePreferences = {};

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    try {
      final notificationPrefs =
          await NotificationPreferencesService.getAllNotificationPreferences();
      final soundPrefs =
          await NotificationPreferencesService.getAllSoundPreferences();
      final advanceTimePrefs =
          await NotificationPreferencesService.getAllAdvanceTimePreferences();

      setState(() {
        _notificationPreferences = notificationPrefs;
        _soundPreferences = soundPrefs;
        _advanceTimePreferences = advanceTimePrefs;
      });
    } catch (e) {
      print('Error loading notification preferences: $e');
    }
  }

  Future<void> _toggleNotification(String prayerName) async {
    final currentValue = _notificationPreferences[prayerName] ?? false;
    final newValue = !currentValue;

    setState(() {
      _notificationPreferences[prayerName] = newValue;
    });

    await NotificationPreferencesService.setPrayerNotificationEnabled(
      prayerName,
      newValue,
    );
    // No direct reschedule here; service will mark and enqueue a background reschedule
  }

  Future<void> _changeSound(String prayerName, String sound) async {
    setState(() {
      _soundPreferences[prayerName] = sound;
    });

    await NotificationPreferencesService.setPrayerSound(prayerName, sound);

    // Indirect reschedule handled by service flagging
  }

  Future<void> _changeAdvanceTime(String prayerName, int minutes) async {
    setState(() {
      _advanceTimePreferences[prayerName] = minutes;
    });

    await NotificationPreferencesService.setPrayerAdvanceTime(
      prayerName,
      minutes,
    );

    // Indirect reschedule handled by service flagging
  }

  Future<void> _testNotification(String prayerName, String soundUrl) async {
    try {
      await updatePrayerNotificationMethod(prayerName, soundUrl).catchError((
        e,
        s,
      ) {
        log(
          'Error updating prayer notification method: $e',
          error: e,
          stackTrace: s,
        );
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error updating prayer notification method: $e'),
          ),
        );
      });

      final prayer = Prayer(
        name: PrayerName.values.firstWhere((e) => e.lCase == prayerName),
        time: DateTime.now().add(const Duration(seconds: 2)),
      );

      await NotificationService.schedulePrayerNotification(
        id: Random().nextInt(100000),
        title: prayer.name!.displayName,
        body: 'Test notification for ${prayer.name?.displayName} prayer.',
        scheduledTime: prayer.time!,
        prayerName: prayerName,
      );

      // await Workmanager().registerOneOffTask(
      //   taskId,
      //   taskId,
      //   constraints: Constraints(
      //     networkType: NetworkType.connected,
      //     requiresBatteryNotLow: false,
      //     requiresCharging: false,
      //     requiresDeviceIdle: false,
      //     requiresStorageNotLow: false,
      //   ),
      // );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Test notification scheduled for ${prayer.time!.difference(DateTime.now()).inSeconds} seconds from now',
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error scheduling test notification: $e')),
        );
      }
    }
  }

  Future<void> updatePrayerNotificationMethod(
    String prayerName,
    String soundUrl,
  ) async {
    try {
      final audio = AdhanAudioLibrary.values.firstWhere(
        (audio) => audio.url == soundUrl,
        orElse: () => AdhanAudioLibrary.defaultAdhan,
      );

      final filesDir = await getApplicationSupportDirectory();
      final dir = Directory('${filesDir.path}/adhan');

      if (!await dir.exists()) {
        await dir.create(recursive: true);
      }

      // Find and delete existing file
      final existingFile = await findFileWithExtension(
        dir.path,
        '$prayerName.',
      );
      if (existingFile != null) {
        await existingFile.delete();
      }

      // Only download if it's not an internal sound
      if (!audio.internal) {
        try {
          final newFileName = '$prayerName.${soundUrl.split('.').last}';
          await NotificationService.downloadSound(soundUrl, newFileName);
        } catch (e) {
          // Log error and potentially show user feedback
          print('Failed to download sound for $prayerName: $e');
          rethrow; // or handle gracefully
        }
      }
    } catch (e) {
      print('Error updating prayer notification method for $prayerName: $e');
      rethrow; // or handle gracefully
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList.radio(
        expandedHeaderPadding: EdgeInsets.zero,
        elevation: 0,
        materialGapSize: 16,
        // separatorBuilder: (context, index) => const SizedBox(height: 8),
        // shrinkWrap: true,
        // itemCount: NotificationPreferencesService.prayerNames.length,
        children: NotificationPreferencesService.prayerNames.entries
            .where((entry) => entry.key != 'sunrise')
            .mapIndexed((index, entry) {
              final prayerTiming = widget.prayerTiming.firstWhere(
                (prayer) =>
                    StringUtils.equalsIgnoreCase(prayer.name?.name, entry.key),
              );

              final prayerKey = entry.key;
              final prayerName = entry.value;
              final isEnabled = _notificationPreferences[prayerKey] ?? false;
              final sound =
                  _soundPreferences[prayerKey] ??
                  AdhanAudioLibrary.defaultAdhan.url;
              final advanceTime = _advanceTimePreferences[prayerKey] ?? 0;

              return ExpansionPanelRadio(
                canTapOnHeader: true,
                value: prayerKey,
                backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HookConsumer(
                        builder: (context, ref, _) {
                          final isLoadingAdhan = useState(false);
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            spacing: 8,
                            children: [
                              Expanded(
                                child: _buildSoundSelector(
                                  prayerKey,
                                  sound,
                                  (isLoading) =>
                                      isLoadingAdhan.value = isLoading,
                                ),
                              ),
                              isLoadingAdhan.value
                                  ? const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : IconButton(
                                      style: IconButton.styleFrom(
                                        foregroundColor: Theme.of(
                                          context,
                                        ).colorScheme.onPrimaryContainer,
                                        padding: EdgeInsets.zero,
                                        visualDensity: VisualDensity.compact,
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      icon: const Icon(Icons.play_arrow),
                                      onPressed: () =>
                                          _testNotification(prayerKey, sound),
                                      tooltip: 'Test notification',
                                    ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      _buildAdvanceTimeSelector(prayerKey, advanceTime),
                    ],
                  ),
                ),

                headerBuilder: (context, isExpanded) => ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        prayerName,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: isEnabled
                                  ? Theme.of(context).colorScheme.onSurface
                                  : Colors.grey,
                            ),
                      ),
                      Text(
                        DateFormat(
                          'h:mm a',
                        ).format(prayerTiming.time ?? DateTime.now()),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: isEnabled
                              ? Theme.of(context).colorScheme.onSurface
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  trailing: Switch(
                    value: isEnabled,
                    onChanged: (value) => _toggleNotification(prayerKey),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  // leading: Icon(
                  //   isEnabled ? Icons.notifications : Icons.notifications_off,
                  //   color: isEnabled ? Theme.of(context).colorScheme.primary : Colors.grey,
                  // ),
                ),
              );
            })
            .toList(),
      ),
    );
  }

  Widget _buildSoundSelector(
    String prayerKey,
    String? currentSound,
    ValueChanged<bool> onLoadingChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sound',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        DropdownButtonFormField<AdhanAudioLibrary>(
          value: AdhanAudioLibrary.values.firstWhere(
            (audio) => audio.url == currentSound,
            orElse: () => AdhanAudioLibrary.defaultAdhan,
          ),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            isDense: true,
          ),
          items: AdhanAudioLibrary.values.map((audio) {
            return DropdownMenuItem(
              value: audio,
              child: Text(
                audio.displayName,
                style: const TextStyle(fontSize: 12),
              ),
            );
          }).toList(),
          onChanged: (value) async {
            if (value == null) return;
            onLoadingChanged(true);
            _changeSound(prayerKey, value.url);
            await updatePrayerNotificationMethod(prayerKey, value.url)
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
                      content: Text('Error downloading sound: ${er.message}'),
                    ),
                  );
                })
                .whenComplete(() {
                  onLoadingChanged(false);
                });
          },
        ),
      ],
    );
  }

  Widget _buildAdvanceTimeSelector(String prayerKey, int currentAdvanceTime) {
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
              child: Slider(
                value: currentAdvanceTime.toDouble(),
                min: 0,
                max: 30,
                divisions: 6,
                label: '${currentAdvanceTime} minutes',
                onChanged: (value) {
                  _changeAdvanceTime(prayerKey, value.round());
                },
              ),
            ),
            SizedBox(
              width: 50,
              child: Text(
                '${currentAdvanceTime}min',
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
