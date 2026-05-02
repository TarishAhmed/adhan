import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../l10n/gen/app_localizations.dart';
import '../../navigation/routes.dart';
import '../../providers/app_providers.dart';
import '../../services/notification_service.dart';
import '../../theme/tokens.dart';

const onboardingDoneKey = 'onboarding_done_v1';

/// 3-page onboarding shown on first launch. Walks the user through:
///   1. Welcome / brand intro
///   2. Permission grant: location
///   3. Permission grant: notifications
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _pageCtrl = PageController();
  int _index = 0;

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  Future<void> _finish() async {
    HapticFeedback.lightImpact();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(onboardingDoneKey, true);
    if (!mounted) return;
    context.go(AppRoutes.home);
  }

  void _next() {
    HapticFeedback.selectionClick();
    if (_index < 2) {
      _pageCtrl.nextPage(
        duration: AppMotion.medium2,
        curve: AppMotion.emphasizedDecelerate,
      );
    } else {
      _finish();
    }
  }

  Future<void> _grantLocation() async {
    HapticFeedback.lightImpact();
    await ref
        .read(locationPermissionProvider.notifier)
        .checkAndRequestPermission();
    _next();
  }

  Future<void> _grantNotifications() async {
    HapticFeedback.lightImpact();
    await NotificationService.requestPermission(context: context);
    _finish();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: _finish,
                child: Text(l.onboardingSkip),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageCtrl,
                onPageChanged: (i) => setState(() => _index = i),
                children: [
                  _Page(
                    icon: Icons.brightness_2_outlined,
                    title: l.onboardingWelcomeTitle,
                    body: l.onboardingWelcomeBody,
                    cta: l.onboardingNext,
                    onCta: _next,
                  ),
                  _Page(
                    icon: Icons.location_on_outlined,
                    title: l.onboardingLocationTitle,
                    body: l.onboardingLocationBody,
                    cta: l.onboardingLocationCta,
                    onCta: _grantLocation,
                  ),
                  _Page(
                    icon: Icons.notifications_active_outlined,
                    title: l.onboardingNotificationsTitle,
                    body: l.onboardingNotificationsBody,
                    cta: l.onboardingNotificationsCta,
                    onCta: _grantNotifications,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (i) {
                  final selected = i == _index;
                  return AnimatedContainer(
                    duration: AppMotion.medium1,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: selected ? 24 : 8,
                    decoration: BoxDecoration(
                      color: selected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.outlineVariant,
                      borderRadius: AppRadius.allLg,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Page extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;
  final String cta;
  final VoidCallback onCta;

  const _Page({
    required this.icon,
    required this.title,
    required this.body,
    required this.cta,
    required this.onCta,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xxl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 144,
            height: 144,
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 72,
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
          Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.displaySmall?.copyWith(
              fontFamily: 'NotoSerif',
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            body,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.xxxl),
          SizedBox(
            width: 240,
            child: FilledButton(
              onPressed: onCta,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
              ),
              child: Text(cta),
            ),
          ),
        ],
      ),
    );
  }
}
