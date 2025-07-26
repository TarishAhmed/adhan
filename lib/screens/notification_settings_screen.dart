import 'package:adhan_app/utils/sound_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adhan_app/services/notification_preferences_service.dart';
import 'package:adhan_app/services/notification_service.dart';
import 'package:adhan_app/services/daily_notification_scheduler.dart';

class NotificationSettingsScreen extends ConsumerStatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  ConsumerState<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends ConsumerState<NotificationSettingsScreen> {
  Map<String, bool> _notificationPreferences = {};
  Map<String, String> _soundPreferences = {};
  Map<String, int> _advanceTimePreferences = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    setState(() => _isLoading = true);

    try {
      final notificationPrefs = await NotificationPreferencesService.getAllNotificationPreferences();
      final soundPrefs = await NotificationPreferencesService.getAllSoundPreferences();
      final advanceTimePrefs = await NotificationPreferencesService.getAllAdvanceTimePreferences();

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

    await NotificationPreferencesService.setPrayerNotificationEnabled(prayerName, newValue);

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

    await NotificationPreferencesService.setPrayerAdvanceTime(prayerName, minutes);

    // Reschedule notifications with new advance time
    await DailyNotificationScheduler.cancelAllNotifications();
    await DailyNotificationScheduler.manuallyScheduleDailyNotifications();
  }

  Future<void> _resetAllPreferences() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset All Preferences'),
        content: const Text('Are you sure you want to reset all notification preferences to defaults?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Reset')),
        ],
      ),
    );

    if (confirmed == true) {
      await NotificationPreferencesService.resetAllPreferences();
      await _loadPreferences();
      await DailyNotificationScheduler.cancelAllNotifications();
      await DailyNotificationScheduler.manuallyScheduleDailyNotifications();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('All preferences reset to defaults')));
      }
    }
  }

  Future<void> _testNotification(String prayerName) async {
    try {
      await NotificationService.schedulePrayerNotification(
        id: 99999,
        title: prayerName,
        body: 'Test notification for $prayerName prayer.',
        scheduledTime: DateTime.now().add(const Duration(seconds: 5)),
        prayerName: prayerName,
      );

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Test notification scheduled for 5 seconds from now')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error scheduling test notification: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _loadPreferences, tooltip: 'Refresh'),
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'reset':
                  _resetAllPreferences();
                  break;
                case 'test_all':
                  _testAllNotifications();
                  break;
                case 'test_scheduler':
                  _testDailyScheduler();
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'reset', child: Text('Reset All Preferences')),
              const PopupMenuItem(value: 'test_all', child: Text('Test All Notifications')),
              const PopupMenuItem(value: 'test_scheduler', child: Text('Test Daily Scheduler')),
            ],
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ExpansionPanelList.radio(
              initialOpenPanelValue: 1,
              children: NotificationPreferencesService.prayerNames.keys.map<ExpansionPanelRadio>((prayerKey) {
                final prayerName = NotificationPreferencesService.prayerNames[prayerKey]!;
                final isEnabled = _notificationPreferences[prayerKey] ?? true;
                final sound = _soundPreferences[prayerKey] ??  AdhanAudioLibrary.values.first.url;
                final advanceTime = _advanceTimePreferences[prayerKey] ?? 0;

                return ExpansionPanelRadio(
                  value: prayerKey,
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSoundSelector(prayerKey, sound),
                      _buildAdvanceTimeSelector(prayerKey, advanceTime),
                      _buildTestButton(prayerKey, prayerName),
                    ],
                  ),
                  headerBuilder: (context, isExpanded) => ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    title: Row(
                      children: [
                        Switch(value: isEnabled, onChanged: (value) => _toggleNotification(prayerKey)),
                        const SizedBox(width: 16),
                        Text(
                          prayerName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isEnabled ? Colors.black : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    subtitle: isEnabled
                        ? Text('Sound: ${sound.replaceAll('_', ' ').toUpperCase()}, Advance: ${advanceTime}min')
                        : const Text('Notifications disabled'),
                  ),
                );
              }).toList(),
            ),
    );
  }

  Widget _buildSoundSelector(String prayerKey, String currentSound) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Notification Sound', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: currentSound,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            items: AdhanAudioLibrary.values.map((audio) {
              return DropdownMenuItem(value: audio.url, child: Text(audio.displayName));
            }).toList(),
            onChanged: (value) {
              if (value == null) return;
              // NotificationService.downloadSound(value, '$prayerKey.mp3');
              print('Downloaded sound for $prayerKey: $value');
              _changeSound(prayerKey, value);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAdvanceTimeSelector(String prayerKey, int currentAdvanceTime) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Advance Notification Time', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
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
              SizedBox(width: 60, child: Text('${currentAdvanceTime}min')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTestButton(String prayerKey, String prayerName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ElevatedButton.icon(
        onPressed: () => _testNotification(prayerKey),
        icon: const Icon(Icons.notifications),
        label: Text('Test $prayerName Notification'),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
      ),
    );
  }

  Future<void> _testAllNotifications() async {
    try {
      for (final prayerKey in NotificationPreferencesService.prayerNames.keys) {
        if (_notificationPreferences[prayerKey] == true) {
          await _testNotification(prayerKey);
        }
      }

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Test notifications scheduled for all enabled prayers')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error scheduling test notifications: $e')));
      }
    }
  }

  /// Test the daily notification scheduler
  Future<void> _testDailyScheduler() async {
    try {
      await DailyNotificationScheduler.manuallyScheduleDailyNotifications();

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Daily notification scheduler test completed')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error testing daily scheduler: $e')));
      }
    }
  }
}
