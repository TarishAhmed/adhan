import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/app_providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final themeMode = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text('Notifications'),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Enable prayer time notifications '),
                        TextSpan(
                          text: '!Coming soon!',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: Switch(
                    value: settings.notificationsEnabled,
                    onChanged: (value) {
                      ref.read(settingsProvider.notifier).toggleNotifications();
                    },
                  ),
                ),
                // ListTile(
                //   leading: const Icon(Icons.language),
                //   title: const Text('Language'),
                //   subtitle: Text(settings.language.toUpperCase()),
                //   trailing: const Icon(Icons.arrow_forward_ios),
                //   onTap: () {
                //     // TODO: Implement language selection
                //   },
                // ),
                ListTile(
                  leading: const Icon(Icons.location_on),
                  title: const Text('Auto Location'),
                  subtitle: const Text('Use device location automatically'),
                  trailing: Switch(
                    value: true, //settings.autoLocation,
                    onChanged: (value) {
                      ref.read(settingsProvider.notifier).toggleAutoLocation();
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.brightness_6),
                  title: const Text('Theme'),
                  subtitle: Text(themeMode.name),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    _showThemeDialog(context, ref);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showThemeDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Theme'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('System'),
              leading: Radio<ThemeMode>(
                value: ThemeMode.system,
                groupValue: ref.watch(themeProvider),
                onChanged: (value) {
                  ref.read(themeProvider.notifier).setTheme(value!);
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: const Text('Light'),
              leading: Radio<ThemeMode>(
                value: ThemeMode.light,
                groupValue: ref.watch(themeProvider),
                onChanged: (value) {
                  ref.read(themeProvider.notifier).setTheme(value!);
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: const Text('Dark'),
              leading: Radio<ThemeMode>(
                value: ThemeMode.dark,
                groupValue: ref.watch(themeProvider),
                onChanged: (value) {
                  ref.read(themeProvider.notifier).setTheme(value!);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
