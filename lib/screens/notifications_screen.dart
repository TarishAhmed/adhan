import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../l10n/gen/app_localizations.dart';
import '../model/prayer_timing_month_response_model.dart';
import '../providers/notification_preferences_provider.dart';
import '../providers/prayer_timing_provider.dart';
import '../services/notification_preferences_service.dart';
import '../services/notification_service.dart';
import '../theme/tokens.dart';
import '../utils/sound_utils.dart';
import '../widgets/prayer_notification_editor_sheet.dart';
import '../widgets/states/empty_state.dart';

/// Per-prayer notification configuration screen. Replaces the old embedded
/// `NotificationSettingsWidget` with a full-screen surface that:
///  - shows a permission banner if the OS-level notification permission is off,
///  - lists each prayer with its time + per-prayer enable switch,
///  - opens the per-prayer editor sheet on tap.
class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  bool? _osNotificationsEnabled;

  @override
  void initState() {
    super.initState();
    _refreshPermissionState();
  }

  Future<void> _refreshPermissionState() async {
    final on = await NotificationService.areNotificationsEnabled();
    if (mounted) setState(() => _osNotificationsEnabled = on);
  }

  Future<void> _requestPermission() async {
    final granted = await NotificationService.requestPermission(
      context: context,
    );
    if (granted) await _refreshPermissionState();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final monthAsync = ref.watch(prayerTimeMonthProvider());

    return Scaffold(
      appBar: AppBar(title: Text(l.notificationsTitle)),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        children: [
          if (_osNotificationsEnabled == false)
            _PermissionBanner(onEnable: _requestPermission),
          monthAsync.when(
            loading: () => const Padding(
              padding: EdgeInsets.all(AppSpacing.xxl),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (e, _) => AppStateView(
              icon: Icons.cloud_off_outlined,
              title: l.errorPrayerTimesGeneric,
              description: e.toString(),
              actionLabel: l.errorRetry,
              onAction: () =>
                  ref.invalidate(prayerTimeMonthProvider()),
            ),
            data: (data) => _PrayerList(monthData: data),
          ),
        ],
      ),
    );
  }
}

class _PermissionBanner extends StatelessWidget {
  final VoidCallback onEnable;
  const _PermissionBanner({required this.onEnable});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.sm,
        AppSpacing.lg,
        AppSpacing.lg,
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: theme.colorScheme.errorContainer,
        borderRadius: AppRadius.allLg,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.notifications_off_outlined,
            color: theme.colorScheme.onErrorContainer,
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l.notificationsPermissionRequired,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onErrorContainer,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                FilledButton.tonal(
                  onPressed: onEnable,
                  child: Text(l.notificationsEnableAction),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PrayerList extends ConsumerWidget {
  final PrayerTimingMonthResponseModel monthData;
  const _PrayerList({required this.monthData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final today = DateTime.now();
    final t = monthData.multiDayTimings;
    if (t == null || t.isEmpty) {
      return const SizedBox.shrink();
    }
    final idx = (today.day - 1).clamp(0, t.length - 1);
    final prayers = t[idx].prayers;
    if (prayers == null) return const SizedBox.shrink();

    // Build the 5-prayer list (skip Sunrise/Sunset for notifications).
    final entries = NotificationPreferencesService.prayerNames.entries
        .where((e) => e.key != 'sunrise')
        .toList();
    return Column(
      children: [
        for (final entry in entries) ...[
          _PrayerNotificationCard(
            prayerKey: entry.key,
            prayerLabel: entry.value,
            time: prayers
                .firstWhereOrNull(
                  (p) => p.name?.lCase == entry.key,
                )
                ?.time,
          ),
          const SizedBox(height: AppSpacing.sm),
        ],
      ],
    );
  }
}

class _PrayerNotificationCard extends ConsumerWidget {
  final String prayerKey;
  final String prayerLabel;
  final DateTime? time;

  const _PrayerNotificationCard({
    required this.prayerKey,
    required this.prayerLabel,
    required this.time,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final enabled = ref.watch(specificNotificationPrefProvider(prayerKey));
    final sound = ref.watch(specificSoundPrefProvider(prayerKey));
    final advance = ref.watch(specificAdvanceTimePrefProvider(prayerKey));

    final isOn = enabled.value ?? false;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Material(
        color: theme.colorScheme.surfaceContainerHigh,
        borderRadius: AppRadius.allLg,
        child: InkWell(
          borderRadius: AppRadius.allLg,
          onTap: () {
            HapticFeedback.selectionClick();
            showPrayerNotificationEditor(
              context,
              prayerKey: prayerKey,
              prayerLabel: prayerLabel,
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            prayerLabel,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: isOn
                                  ? theme.colorScheme.onSurface
                                  : theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          if (time != null)
                            Text(
                              DateFormat.jm().format(time!),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                                fontFeatures: const [
                                  FontFeature.tabularFigures(),
                                ],
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        _subtitle(sound.value, advance.value),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: isOn,
                  onChanged: enabled.isLoading
                      ? null
                      : (v) {
                          HapticFeedback.lightImpact();
                          ref
                              .read(
                                specificNotificationPrefProvider(prayerKey)
                                    .notifier,
                              )
                              .toggleNotification(prayerKey, v);
                        },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _subtitle(String? soundUrl, int? advanceMins) {
    final soundName = soundUrl == null
        ? '—'
        : (AdhanAudioLibrary.values
                .firstWhereOrNull((a) => a.url == soundUrl)
                ?.displayName ??
            'Default');
    final advance = (advanceMins ?? 0) > 0 ? ' • ${advanceMins!} min before' : '';
    return '$soundName$advance';
  }
}
