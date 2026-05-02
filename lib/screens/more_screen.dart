import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../l10n/gen/app_localizations.dart';
import '../navigation/routes.dart';
import '../theme/tokens.dart';

/// Top-level "More" hub. Replaces the legacy SettingsScreen as the catch-all
/// destination behind the bottom-nav. Groups settings into:
///   - Prayer  (Notifications, Location)
///   - Appearance (Theme, Language)
///   - Advanced (Battery, Background, Database, Home Widget) — debug-gated
///   - About
class MoreScreen extends ConsumerWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l.navMore),
        scrolledUnderElevation: 1,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
        children: [
          _SectionHeader(label: l.moreSectionPrayer),
          _MoreTile(
            icon: Icons.notifications_outlined,
            title: l.moreNotifications,
            subtitle: l.moreNotificationsSubtitle,
            onTap: () => context.push(AppRoutes.notifications),
          ),
          _MoreTile(
            icon: Icons.location_on_outlined,
            title: l.moreLocation,
            subtitle: l.moreLocationSubtitle,
            onTap: () => context.push(AppRoutes.location),
          ),

          const SizedBox(height: AppSpacing.lg),
          _SectionHeader(label: l.moreSectionAppearance),
          _MoreTile(
            icon: Icons.palette_outlined,
            title: l.moreTheme,
            onTap: () => context.push(AppRoutes.appearance),
          ),

          const SizedBox(height: AppSpacing.lg),
          _SectionHeader(label: l.moreSectionAdvanced),
          _MoreTile(
            icon: Icons.tune,
            title: l.moreSectionAdvanced,
            subtitle: kDebugMode
                ? 'Battery, background service, cached data, widget'
                : 'Battery, cached data',
            onTap: () => context.push(AppRoutes.advanced),
          ),

          const SizedBox(height: AppSpacing.lg),
          _SectionHeader(label: l.moreSectionAbout),
          _MoreTile(
            icon: Icons.info_outline,
            title: l.moreAbout,
            onTap: () => _showAboutSheet(context),
          ),

          const SizedBox(height: AppSpacing.xxxl),
          Center(
            child: Text(
              'Adhan',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xxxl),
        ],
      ),
    );
  }

  Future<void> _showAboutSheet(BuildContext context) async {
    final info = await PackageInfo.fromPlatform();
    if (!context.mounted) return;
    showAboutDialog(
      context: context,
      applicationName: 'Adhan',
      applicationVersion: '${info.version} (${info.buildNumber})',
      applicationLegalese: '© ${DateTime.now().year} Adhan',
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String label;
  const _SectionHeader({required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.md,
        AppSpacing.lg,
        AppSpacing.sm,
      ),
      child: Text(
        label.toUpperCase(),
        style: theme.textTheme.labelSmall?.copyWith(
          color: theme.colorScheme.primary,
          letterSpacing: 1.2,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _MoreTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  const _MoreTile({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Icon(icon, color: theme.colorScheme.primary),
      title: Text(title, style: theme.textTheme.bodyLarge),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            )
          : null,
      trailing: Icon(
        Icons.chevron_right,
        color: theme.colorScheme.outline,
      ),
      onTap: () {
        HapticFeedback.selectionClick();
        onTap();
      },
    );
  }
}
