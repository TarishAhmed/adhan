import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adhan_app/services/notification_preferences_service.dart';
import 'package:adhan_app/services/notification_service.dart';
import 'package:adhan_app/services/daily_notification_scheduler.dart';

class NotificationSettingsWidget extends ConsumerStatefulWidget {
  const NotificationSettingsWidget({super.key});

  @override
  ConsumerState<NotificationSettingsWidget> createState() =>
      _NotificationSettingsWidgetState();
}

class _NotificationSettingsWidgetState
    extends ConsumerState<NotificationSettingsWidget> {
  Map<String, bool> _notificationPreferences = {};
  Map<String, String> _soundPreferences = {};
  Map<String, int> _advanceTimePreferences = {};
  bool _isLoading = true;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    setState(() => _isLoading = true);

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
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading notification preferences: $e');
      setState(() => _isLoading = false);
    }
  }

  Future<void> _toggleNotification(String prayerName) async {
    final currentValue = _notificationPreferences[prayerName] ?? true;
    final newValue = !currentValue;

    setState(() {
      _notificationPreferences[prayerName] = newValue;
    });

    await NotificationPreferencesService.setPrayerNotificationEnabled(
      prayerName,
      newValue,
    );

    // Reschedule notifications if enabled
    if (newValue) {
      await DailyNotificationScheduler.manuallyScheduleDailyNotifications();
    } else {
      await DailyNotificationScheduler.cancelAllNotifications();
      await DailyNotificationScheduler.manuallyScheduleDailyNotifications();
    }
  }

  Future<void> _changeSound(String prayerName, String sound) async {
    setState(() {
      _soundPreferences[prayerName] = sound;
    });

    await NotificationPreferencesService.setPrayerSound(prayerName, sound);

    // Reschedule notifications with new sound
    await DailyNotificationScheduler.cancelAllNotifications();
    await DailyNotificationScheduler.manuallyScheduleDailyNotifications();
  }

  Future<void> _changeAdvanceTime(String prayerName, int minutes) async {
    setState(() {
      _advanceTimePreferences[prayerName] = minutes;
    });

    await NotificationPreferencesService.setPrayerAdvanceTime(
      prayerName,
      minutes,
    );

    // Reschedule notifications with new advance time
    await DailyNotificationScheduler.cancelAllNotifications();
    await DailyNotificationScheduler.manuallyScheduleDailyNotifications();
  }

  Future<void> _testNotification(String prayerName) async {
    try {
      await NotificationService.schedulePrayerNotification(
        id: Random().nextInt(100000),
        title:
            '${NotificationPreferencesService.prayerNames[prayerName]} Prayer',
        body:
            'Test notification for ${NotificationPreferencesService.prayerNames[prayerName]} prayer.',
        scheduledTime: DateTime.now().add(const Duration(seconds: 5)),
        sound: _getAdhanSound(_soundPreferences[prayerName] ?? 'default'),
        prayerName: prayerName,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Test notification scheduled for 5 seconds from now'),
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

  AdhanSound _getAdhanSound(String soundName) {
    switch (soundName) {
      case 'mishary_rashid_alafasy':
        return AdhanSound.misharyRashidAlafasy;
      case 'mishary_rashid_alafasy_2':
        return AdhanSound.misharyRashidAlafasy2;
      case 'mishary_rashid_alafasy_3':
        return AdhanSound.misharyRashidAlafasy3;
      case 'mansour_al_zahrani':
        return AdhanSound.mansourAlZahrani;
      case 'hafiz_mustafa_ozcan':
        return AdhanSound.hafizMustafaOzcan;
      case 'karl_jenkins':
        return AdhanSound.karlJenkins;
      case 'ahmad_al_nafees':
        return AdhanSound.ahmadAlNafees;
      default:
        return AdhanSound.defaultRingtone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      shrinkWrap: true,
      itemCount: NotificationPreferencesService.prayerNames.length,
      itemBuilder: (context, index) {
        final entry = NotificationPreferencesService.prayerNames.entries
            .elementAt(index);
        final prayerKey = entry.key;
        final prayerName = entry.value;
        final isEnabled = _notificationPreferences[prayerKey] ?? true;
        final sound = _soundPreferences[prayerKey] ?? 'default';
        final advanceTime = _advanceTimePreferences[prayerKey] ?? 0;

        return ExpansionTile(
          backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
          collapsedBackgroundColor: Theme.of(
            context,
          ).colorScheme.surfaceContainer,

          childrenPadding: const EdgeInsets.symmetric(horizontal: 32),
          title: Text(
            prayerName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isEnabled
                  ? Theme.of(context).colorScheme.onSurface
                  : Colors.grey,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () => _testNotification(prayerKey),
                tooltip: 'Test notification',
              ),
              Switch(
                value: isEnabled,
                onChanged: (value) => _toggleNotification(prayerKey),
              ),
            ],
          ),
          children: [
            const SizedBox(height: 8),
            _buildSoundSelector(prayerKey, sound),
            const SizedBox(height: 8),
            _buildAdvanceTimeSelector(prayerKey, advanceTime),
          ],
        );
      },
    );
  }

  Widget _buildSoundSelector(String prayerKey, String currentSound) {
    final sounds = {
      'default': 'Default Ringtone',
      'mishary_rashid_alafasy': 'Mishary Rashid Alafasy',
      'mishary_rashid_alafasy_2': 'Mishary Rashid Alafasy 2',
      'mishary_rashid_alafasy_3': 'Mishary Rashid Alafasy 3',
      'mansour_al_zahrani': 'Mansour Al Zahrani',
      'hafiz_mustafa_ozcan': 'Hafiz Mustafa Ozcan',
      'karl_jenkins': 'Karl Jenkins',
      'ahmad_al_nafees': 'Ahmad Al Nafees',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sound',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        DropdownButtonFormField<String>(
          value: currentSound,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            isDense: true,
          ),
          items: sounds.entries.map((entry) {
            return DropdownMenuItem(
              value: entry.key,
              child: Text(entry.value, style: const TextStyle(fontSize: 12)),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              _changeSound(prayerKey, value);
            }
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
