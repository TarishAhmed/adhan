import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../l10n/gen/app_localizations.dart';
import '../providers/notification_preferences_provider.dart';
import '../services/notification_service.dart';
import '../theme/tokens.dart';
import '../utils/app_logger.dart';
import '../utils/sound_utils.dart';

/// Day-of-week chips used in the editor.
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

const _padding = AppSpacing.lg;

/// Shows a 2-page bottom sheet for editing one prayer's notification settings.
/// Page 1 — main: enable toggle (top of sheet via switch in caller), days,
/// advance time, sound chooser entry, test button.
/// Page 2 — sound picker.
Future<void> showPrayerNotificationEditor(
  BuildContext context, {
  required String prayerKey,
  required String prayerLabel,
}) {
  return WoltModalSheet.show<void>(
    context: context,
    pageListBuilder: (modalCtx) {
      final tt = Theme.of(context).textTheme;
      return [
        WoltModalSheetPage(
          hasSabGradient: false,
          topBarTitle: Text(prayerLabel, style: tt.titleMedium),
          isTopBarLayerAlwaysVisible: true,
          trailingNavBarWidget: IconButton(
            padding: const EdgeInsets.all(_padding),
            icon: const Icon(Icons.close),
            onPressed: Navigator.of(modalCtx).pop,
          ),
          child: _MainEditorPage(prayerKey: prayerKey),
        ),
        WoltModalSheetPage(
          hasSabGradient: false,
          topBarTitle: Text(
            '$prayerLabel — Sound',
            style: tt.titleMedium,
          ),
          isTopBarLayerAlwaysVisible: true,
          leadingNavBarWidget: Padding(
            padding: const EdgeInsets.all(_padding),
            child: BackButton(
              onPressed: () => WoltModalSheet.of(modalCtx).showPrevious(),
            ),
          ),
          trailingNavBarWidget: IconButton(
            padding: const EdgeInsets.all(_padding),
            icon: const Icon(Icons.close),
            onPressed: Navigator.of(modalCtx).pop,
          ),
          child: _SoundPickerPage(prayerKey: prayerKey),
        ),
      ];
    },
  );
}

class _MainEditorPage extends HookConsumerWidget {
  final String prayerKey;
  const _MainEditorPage({required this.prayerKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final enabled = ref.watch(specificNotificationPrefProvider(prayerKey));
    final sound = ref.watch(specificSoundPrefProvider(prayerKey));
    final advance = ref.watch(specificAdvanceTimePrefProvider(prayerKey));
    final days = ref.watch(specificDayPrefProvider(prayerKey));
    final isTesting = useState(false);

    return Padding(
      padding: const EdgeInsets.all(_padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Days
          Text(
            l.notificationsDays.toUpperCase(),
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.primary,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          days.when(
            loading: () => const SizedBox(
              height: 40,
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (e, _) => Text('Error: $e'),
            data: (selected) => _DaysRow(
              prayerKey: prayerKey,
              selected: selected,
              isEnabled: enabled.value ?? false,
            ),
          ),

          const SizedBox(height: AppSpacing.xl),

          // Sound
          Text(
            l.notificationsSound.toUpperCase(),
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.primary,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: sound.when(
              loading: () => const Text('…'),
              error: (e, _) => Text('Error: $e'),
              data: (url) => Text(
                AdhanAudioLibrary.values
                        .firstWhereOrNull((a) => a.url == url)
                        ?.displayName ??
                    l.notificationsSoundDefault,
                style: theme.textTheme.bodyLarge,
              ),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => WoltModalSheet.of(context).showNext(),
          ),

          const SizedBox(height: AppSpacing.lg),

          // Advance time
          Text(
            l.notificationsAdvanceTime.toUpperCase(),
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.primary,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600,
            ),
          ),
          advance.when(
            loading: () => const SizedBox(
              height: 40,
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (e, _) => Text('Error: $e'),
            data: (mins) => Row(
              children: [
                Expanded(
                  child: Slider(
                    value: mins.toDouble(),
                    min: 0,
                    max: 30,
                    divisions: 6,
                    label: l.notificationsAdvanceTimeMinutes(mins),
                    onChanged: (v) => ref
                        .read(
                          specificAdvanceTimePrefProvider(prayerKey).notifier,
                        )
                        .setAdvanceTimePref(prayerKey, v.round()),
                  ),
                ),
                SizedBox(
                  width: 56,
                  child: Text(
                    l.notificationsAdvanceTimeMinutes(mins),
                    textAlign: TextAlign.end,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.lg),

          // Test button
          SizedBox(
            width: double.infinity,
            child: FilledButton.tonalIcon(
              onPressed: isTesting.value
                  ? null
                  : () async {
                      isTesting.value = true;
                      HapticFeedback.lightImpact();
                      try {
                        final url = sound.value ??
                            AdhanAudioLibrary.defaultAdhan.url;
                        await _scheduleTest(prayerKey, url);
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(l.notificationsTestScheduled)),
                        );
                      } catch (e, st) {
                        AppLogger.e(
                          'Test notification failed',
                          error: e,
                          stackTrace: st,
                        );
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Test failed: $e')),
                        );
                      } finally {
                        isTesting.value = false;
                      }
                    },
              icon: isTesting.value
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.notifications_active_outlined),
              label: Text(l.notificationsTestButton),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _scheduleTest(String prayerKey, String soundUrl) async {
    // Make sure the sound file is in place
    await _ensureSoundFile(prayerKey, soundUrl);
    final scheduled = DateTime.now().add(const Duration(seconds: 2));
    await NotificationService.schedulePrayerNotification(
      id: 999000 + prayerKey.hashCode % 1000,
      title: 'Test — $prayerKey',
      body: 'This is a test notification.',
      scheduledTime: scheduled,
      prayerName: prayerKey,
    );
  }
}

class _DaysRow extends ConsumerWidget {
  final String prayerKey;
  final Set<String> selected;
  final bool isEnabled;
  const _DaysRow({
    required this.prayerKey,
    required this.selected,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: DayOfWeek.values.map((day) {
        final picked = selected.contains(day.abbreviation);
        return InkWell(
          onTap: !isEnabled
              ? null
              : () {
                  HapticFeedback.selectionClick();
                  final next = {...selected};
                  if (picked) {
                    next.remove(day.abbreviation);
                  } else {
                    next.add(day.abbreviation);
                  }
                  ref
                      .read(specificDayPrefProvider(prayerKey).notifier)
                      .setDayPref(prayerKey, next);
                },
          customBorder: const RoundedRectangleBorder(
            borderRadius: AppRadius.allMd,
          ),
          child: Container(
            width: 38,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: picked && isEnabled
                  ? theme.colorScheme.primary
                  : Colors.transparent,
              borderRadius: AppRadius.allMd,
              border: Border.all(
                color: isEnabled
                    ? (picked
                        ? theme.colorScheme.primary
                        : theme.colorScheme.outline)
                    : theme.colorScheme.outlineVariant,
              ),
            ),
            child: Text(
              day.abbreviation,
              style: theme.textTheme.labelSmall?.copyWith(
                color: !isEnabled
                    ? theme.colorScheme.outline
                    : (picked
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.onSurface),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _SoundPickerPage extends StatefulHookConsumerWidget {
  final String prayerKey;
  const _SoundPickerPage({required this.prayerKey});

  @override
  ConsumerState<_SoundPickerPage> createState() => _SoundPickerPageState();
}

class _SoundPickerPageState extends ConsumerState<_SoundPickerPage> {
  final _player = AudioPlayer();
  AdhanAudioLibrary? _busyOption;

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _selectAndPreview(AdhanAudioLibrary audio) async {
    setState(() => _busyOption = audio);
    HapticFeedback.selectionClick();
    try {
      ref
          .read(specificSoundPrefProvider(widget.prayerKey).notifier)
          .setSoundPref(widget.prayerKey, audio.url);
      await _ensureSoundFile(widget.prayerKey, audio.url, player: _player);
    } catch (e, st) {
      if (e is DioException) {
        AppLogger.e(
          'Sound download failed',
          error: e,
          stackTrace: st,
        );
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Download failed: ${e.message}')),
        );
      } else {
        AppLogger.e('Sound select failed', error: e, stackTrace: st);
      }
    } finally {
      if (mounted) setState(() => _busyOption = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final selected = ref.watch(specificSoundPrefProvider(widget.prayerKey));
    return selected.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Padding(
        padding: const EdgeInsets.all(_padding),
        child: Text('Error: $e'),
      ),
      data: (selectedUrl) {
        final picked = AdhanAudioLibrary.values.firstWhere(
          (a) => a.url == selectedUrl,
          orElse: () => AdhanAudioLibrary.defaultAdhan,
        );
        return Padding(
          padding: const EdgeInsets.all(_padding),
          child: Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: AdhanAudioLibrary.values.map((audio) {
              final isPicked = audio == picked;
              final isBusy = _busyOption == audio;
              return ChoiceChip(
                showCheckmark: true,
                selected: isPicked,
                onSelected: (_) => _selectAndPreview(audio),
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(audio.displayName),
                    if (isBusy) ...[
                      const SizedBox(width: AppSpacing.sm),
                      const SizedBox(
                        width: 14,
                        height: 14,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ],
                  ],
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

/// Ensures the chosen sound is available in the local adhan/ dir for this prayer.
/// If [player] is provided, plays the resulting file once for preview.
Future<void> _ensureSoundFile(
  String prayerKey,
  String soundUrl, {
  AudioPlayer? player,
}) async {
  final audio = AdhanAudioLibrary.values.firstWhere(
    (a) => a.url == soundUrl,
    orElse: () => AdhanAudioLibrary.defaultAdhan,
  );
  if (audio.internal) return;

  final filesDir = await getApplicationSupportDirectory();
  final dir = Directory('${filesDir.path}/adhan');
  if (!await dir.exists()) await dir.create(recursive: true);

  final fileName = soundUrl.split('/').last;
  File? existing = await findFileWithExtension(dir.path, fileName);
  if (existing == null) {
    final downloaded = await NotificationService.downloadSound(
      soundUrl,
      fileName,
    );
    existing = File(downloaded);
  }

  // Copy under <prayerKey>.<ext> so the notification channel can find it.
  final newName = '$prayerKey.${soundUrl.split('.').last}';
  await NotificationService.copyFile(fileName, newName);

  if (player != null) {
    if (player.playing) await player.stop();
    await player.setFilePath(existing.path);
    await player.play();
  }
}
