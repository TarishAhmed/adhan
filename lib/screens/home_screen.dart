import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../l10n/gen/app_localizations.dart';
import '../model/prayer_timing_month_response_model.dart';
import '../navigation/routes.dart';
import '../providers/app_providers.dart';
import '../providers/prayer_timing_provider.dart';
import '../services/home_widget_service.dart';
import '../theme/tokens.dart';
import '../utils/greeting.dart';
import '../utils/hijri_format.dart';
import '../widgets/prayer_progress_bar.dart';
import '../widgets/states/empty_state.dart';

/// Home dashboard. Centerpiece of the Phase 3 redesign:
///  - SliverAppBar with greeting + city chip + refresh.
///  - Hero "Up next" prayer card with live HH:MM:SS countdown + segmented bar.
///  - Today timeline of 5 prayer chips.
///  - Quick-action row: Qibla / Notifications / Location.
///  - Hijri date footer (approx).
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _refreshing = false;

  Future<void> _refresh() async {
    if (_refreshing) return;
    HapticFeedback.lightImpact();
    setState(() => _refreshing = true);
    try {
      await ref
          .read(prayerTimeMonthProvider().notifier)
          .refreshPrayerTimes(ref.container);
      await HomeWidgetService.manualUpdate(ref.container);
      if (!mounted) return;
      final l = AppLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l.homeRefreshSuccess),
          duration: const Duration(seconds: 2),
        ),
      );
    } catch (_) {
      if (!mounted) return;
      final l = AppLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l.homeRefreshFailure)),
      );
    } finally {
      if (mounted) setState(() => _refreshing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final locationAsync = ref.watch(locationProvider);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          slivers: [
            SliverAppBar.large(
              pinned: true,
              expandedHeight: 132,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsetsDirectional.fromSTEB(
                  AppSpacing.lg,
                  0,
                  AppSpacing.lg,
                  AppSpacing.lg,
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      greetingFor(context),
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontFamily: 'NotoSerif',
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                _LocationChip(
                  city: locationAsync.maybeWhen(
                    data: (loc) => loc.city ?? l.locationTitle,
                    orElse: () => '…',
                  ),
                  onTap: () => context.push(AppRoutes.location),
                ),
                IconButton(
                  tooltip: l.homeRefreshTooltip,
                  onPressed: _refreshing ? null : _refresh,
                  icon: AnimatedRotation(
                    turns: _refreshing ? 1 : 0,
                    duration: AppMotion.long2,
                    child: const Icon(Icons.refresh),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
              ],
            ),
            SliverToBoxAdapter(
              child: locationAsync.when(
                loading: () => const _LoadingHero(),
                error: (e, _) => _LocationErrorHero(error: e),
                data: (_) => const _NextPrayerHero(),
              ),
            ),
            SliverToBoxAdapter(
              child: locationAsync.maybeWhen(
                data: (_) => const _TodayTimeline(),
                orElse: () => const SizedBox.shrink(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  AppSpacing.xxl,
                  AppSpacing.lg,
                  AppSpacing.md,
                ),
                child: _QuickActions(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  AppSpacing.lg,
                  AppSpacing.lg,
                  AppSpacing.xxxl,
                ),
                child: _HijriFooter(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LocationChip extends StatelessWidget {
  final String city;
  final VoidCallback onTap;
  const _LocationChip({required this.city, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: ActionChip(
        avatar: const Icon(Icons.location_on_outlined, size: 18),
        label: Text(city),
        onPressed: () {
          HapticFeedback.selectionClick();
          onTap();
        },
      ),
    );
  }
}

class _LoadingHero extends StatelessWidget {
  const _LoadingHero();
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(AppSpacing.xl),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}

class _LocationErrorHero extends ConsumerWidget {
  final Object error;
  const _LocationErrorHero({required this.error});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    return AppStateView(
      icon: Icons.location_off_outlined,
      title: l.errorLocationGeneric,
      description: error.toString(),
      actionLabel: l.errorRetry,
      onAction: () => ref.invalidate(locationProvider),
    );
  }
}

class _NextPrayerHero extends ConsumerWidget {
  const _NextPrayerHero();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final timeline = ref.watch(prayerTimelineStreamProvider);
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.sm,
        AppSpacing.lg,
        AppSpacing.lg,
      ),
      child: timeline.when(
        loading: () => _HeroSkeleton(theme: theme),
        error: (e, _) => AppStateView(
          icon: Icons.cloud_off_outlined,
          title: l.errorPrayerTimesGeneric,
          description: e.toString(),
          actionLabel: l.errorRetry,
          onAction: () =>
              ref.invalidate(prayerTimeMonthProvider()),
        ),
        data: (window) {
          if (window == null) {
            return _heroShell(theme, child: const SizedBox(height: 100));
          }
          final progress = (window.progress ?? 0).clamp(0.0, 1.0);
          return _heroShell(
            theme,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l.homeNextPrayerLabel.toUpperCase(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer.withValues(
                      alpha: 0.7,
                    ),
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        window.next.name.displayName,
                        style: theme.textTheme.displaySmall?.copyWith(
                          color: theme.colorScheme.onPrimaryContainer,
                          fontFamily: 'NotoSerif',
                          height: 1.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        DateFormat.jm().format(window.next.time),
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onPrimaryContainer
                              .withValues(alpha: 0.8),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                _LiveCountdown(target: window.next.time),
                const SizedBox(height: AppSpacing.lg),
                PrayerProgressBar(
                  segments: window.segments,
                  progress: progress,
                ),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      window.current.name.displayName,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer
                            .withValues(alpha: 0.7),
                      ),
                    ),
                    Text(
                      window.next.name.displayName,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer
                            .withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _heroShell(ThemeData theme, {required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primaryContainer,
            theme.colorScheme.surfaceContainerHigh,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppRadius.allXl,
      ),
      child: child,
    );
  }
}

/// Skeleton placeholder for the next-prayer hero, shown during cold-start.
/// Mirrors the real layout so users see structure rather than a spinner.
class _HeroSkeleton extends StatelessWidget {
  final ThemeData theme;
  const _HeroSkeleton({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.xl),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHigh,
          borderRadius: AppRadius.allXl,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('UP NEXT', style: theme.textTheme.labelSmall),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Maghrib',
              style: theme.textTheme.displaySmall?.copyWith(height: 1.0),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              '01:23:45',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontFeatures: const [FontFeature.tabularFigures()],
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Container(
              height: 10,
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Asr', style: theme.textTheme.bodySmall),
                Text('Maghrib', style: theme.textTheme.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Skeleton for the today-timeline horizontal chip strip.
class _TimelineSkeleton extends StatelessWidget {
  final ThemeData theme;
  const _TimelineSkeleton({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SizedBox(
        height: 96,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
          itemBuilder: (_, __) => Container(
            width: 96,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHigh,
              borderRadius: AppRadius.allLg,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.md,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Maghrib', style: theme.textTheme.labelLarge),
                  const SizedBox(height: AppSpacing.xs),
                  Text('6:45 PM', style: theme.textTheme.bodySmall),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Live HH:MM:SS countdown to a target moment, refreshing every second.
class _LiveCountdown extends StatefulWidget {
  final DateTime target;
  const _LiveCountdown({required this.target});

  @override
  State<_LiveCountdown> createState() => _LiveCountdownState();
}

class _LiveCountdownState extends State<_LiveCountdown> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final remaining = widget.target.difference(DateTime.now());
    final secs = remaining.inSeconds.clamp(0, 86400 * 2);
    final h = (secs ~/ 3600).toString().padLeft(2, '0');
    final m = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    final s = (secs % 60).toString().padLeft(2, '0');
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _DigitGroup(text: '$h:$m:$s', theme: theme),
        const SizedBox(width: AppSpacing.sm),
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text(
            'remaining',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onPrimaryContainer.withValues(
                alpha: 0.7,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DigitGroup extends StatelessWidget {
  final String text;
  final ThemeData theme;
  const _DigitGroup({required this.text, required this.theme});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: AppMotion.short3,
      transitionBuilder: (child, animation) =>
          FadeTransition(opacity: animation, child: child),
      child: Text(
        text,
        key: ValueKey(text),
        style: theme.textTheme.headlineMedium?.copyWith(
          fontFamily: 'Inter',
          fontFeatures: const [FontFeature.tabularFigures()],
          color: theme.colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _TodayTimeline extends ConsumerWidget {
  const _TodayTimeline();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final monthAsync = ref.watch(prayerTimeMonthProvider());
    return monthAsync.when(
      loading: () => _TimelineSkeleton(theme: theme),
      error: (_, __) => const SizedBox.shrink(),
      data: (data) {
        final today = DateTime.now();
        final t = data.multiDayTimings;
        if (t == null || t.isEmpty) return const SizedBox.shrink();
        final idx = (today.day - 1).clamp(0, t.length - 1);
        final prayers = t[idx].prayers;
        if (prayers == null) return const SizedBox.shrink();

        final visible = <Prayer>[
          for (final p in prayers)
            if (p.name != null &&
                p.time != null &&
                p.name != PrayerName.SUNRISE &&
                p.name != PrayerName.SUNSET)
              p,
        ];
        final now = DateTime.now();
        return SizedBox(
          height: 96,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            scrollDirection: Axis.horizontal,
            itemCount: visible.length,
            separatorBuilder: (_, __) =>
                const SizedBox(width: AppSpacing.md),
            itemBuilder: (_, i) {
              final p = visible[i];
              final isCurrent = _isCurrentPrayer(visible, i, now);
              return _PrayerChip(
                name: p.name!.displayName,
                time: p.time!,
                isCurrent: isCurrent,
                theme: theme,
              );
            },
          ),
        );
      },
    );
  }

  bool _isCurrentPrayer(List<Prayer> list, int i, DateTime now) {
    final start = list[i].time;
    if (start == null) return false;
    final end = i + 1 < list.length ? list[i + 1].time : null;
    if (now.isBefore(start)) return false;
    if (end == null) return now.isAfter(start);
    return now.isBefore(end);
  }
}

class _PrayerChip extends StatelessWidget {
  final String name;
  final DateTime time;
  final bool isCurrent;
  final ThemeData theme;

  const _PrayerChip({
    required this.name,
    required this.time,
    required this.isCurrent,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final cs = theme.colorScheme;
    return Container(
      width: 96,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: isCurrent ? cs.primaryContainer : cs.surfaceContainerHigh,
        borderRadius: AppRadius.allLg,
        border: Border.all(
          color: isCurrent ? cs.primary : cs.outlineVariant,
          width: isCurrent ? 2 : 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: theme.textTheme.labelLarge?.copyWith(
              color: isCurrent ? cs.onPrimaryContainer : cs.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            DateFormat.jm().format(time),
            style: theme.textTheme.bodySmall?.copyWith(
              color: isCurrent
                  ? cs.onPrimaryContainer.withValues(alpha: 0.85)
                  : cs.onSurfaceVariant,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Row(
      children: [
        Expanded(
          child: _ActionTile(
            icon: Icons.explore_outlined,
            label: l.homeQuickActionQibla,
            onTap: () => context.push(AppRoutes.qibla),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: _ActionTile(
            icon: Icons.notifications_outlined,
            label: l.homeQuickActionNotifications,
            onTap: () => context.push(AppRoutes.notifications),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: _ActionTile(
            icon: Icons.location_on_outlined,
            label: l.homeQuickActionLocation,
            onTap: () => context.push(AppRoutes.location),
          ),
        ),
      ],
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ActionTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surfaceContainerHigh,
      borderRadius: AppRadius.allLg,
      child: InkWell(
        borderRadius: AppRadius.allLg,
        onTap: () {
          HapticFeedback.selectionClick();
          onTap();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
          child: Column(
            children: [
              Icon(icon, color: theme.colorScheme.primary, size: 28),
              const SizedBox(height: AppSpacing.sm),
              Text(
                label,
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HijriFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hijri = formatHijri(DateTime.now());
    final greg = DateFormat.yMMMMd().format(DateTime.now());
    return Center(
      child: Column(
        children: [
          Text(
            greg,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          if (hijri != null) ...[
            const SizedBox(height: 2),
            Text(
              '$hijri (approx.)',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
