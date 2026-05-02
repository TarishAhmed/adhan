import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../l10n/gen/app_localizations.dart';
import '../navigation/routes.dart';
import '../screens/advanced_screen.dart';
import '../screens/appearance_screen.dart';
import '../screens/home_screen.dart';
import '../screens/location_screen.dart';
import '../screens/more_screen.dart';
import '../screens/notifications_screen.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../screens/qibla_compass_screen.dart';
import '../services/location_storage_service.dart';
import '../theme/tokens.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final prefs = ref.read(sharedPrefProvider);
  return GoRouter(
    initialLocation: AppRoutes.home,
    redirect: (context, state) {
      final done = prefs.getBool(onboardingDoneKey) ?? false;
      final goingToOnboarding = state.matchedLocation == AppRoutes.onboarding;
      if (!done && !goingToOnboarding) return AppRoutes.onboarding;
      if (done && goingToOnboarding) return AppRoutes.home;
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        pageBuilder: (context, state) =>
            _slideUpPage(const OnboardingScreen(), state),
      ),
      ShellRoute(
        builder: (context, state, child) =>
            ScaffoldWithBottomNavigation(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.home,
            pageBuilder: (context, state) =>
                _sharedAxisPage(const HomeScreen(), state),
          ),
          GoRoute(
            path: AppRoutes.qibla,
            pageBuilder: (context, state) =>
                _sharedAxisPage(const QiblaCompassScreen(), state),
          ),
          GoRoute(
            path: AppRoutes.more,
            pageBuilder: (context, state) =>
                _sharedAxisPage(const MoreScreen(), state),
          ),
        ],
      ),
      // Pushed routes (outside the shell) — full-screen with back button.
      GoRoute(
        path: AppRoutes.notifications,
        pageBuilder: (context, state) =>
            _slideUpPage(const NotificationsScreen(), state),
      ),
      GoRoute(
        path: AppRoutes.location,
        pageBuilder: (context, state) =>
            _slideUpPage(const LocationScreen(), state),
      ),
      GoRoute(
        path: AppRoutes.appearance,
        pageBuilder: (context, state) =>
            _slideUpPage(const AppearanceScreen(), state),
      ),
      GoRoute(
        path: AppRoutes.advanced,
        pageBuilder: (context, state) =>
            _slideUpPage(const AdvancedScreen(), state),
      ),
    ],
  );
});

/// Tab transition: fade-through (M3 shared-axis-Z feel without extra deps).
CustomTransitionPage<dynamic> _sharedAxisPage(
  Widget child,
  GoRouterState state,
) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: AppMotion.medium2,
    reverseTransitionDuration: AppMotion.medium1,
    transitionsBuilder: (context, animation, secondary, child) {
      final fadeIn = CurvedAnimation(
        parent: animation,
        curve: const Interval(0.3, 1.0, curve: AppMotion.standardDecelerate),
      );
      final scaleIn = Tween<double>(begin: 0.94, end: 1.0).animate(
        CurvedAnimation(
          parent: animation,
          curve: AppMotion.emphasizedDecelerate,
        ),
      );
      final fadeOut = CurvedAnimation(
        parent: secondary,
        curve: const Interval(0.0, 0.3, curve: AppMotion.standardAccelerate),
      );
      return FadeTransition(
        opacity: ReverseAnimation(fadeOut),
        child: FadeTransition(
          opacity: fadeIn,
          child: ScaleTransition(scale: scaleIn, child: child),
        ),
      );
    },
  );
}

/// Pushed-screen transition: slide up + fade.
CustomTransitionPage<dynamic> _slideUpPage(Widget child, GoRouterState state) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: AppMotion.medium3,
    reverseTransitionDuration: AppMotion.medium2,
    transitionsBuilder: (context, animation, secondary, child) {
      final slide = Tween<Offset>(
        begin: const Offset(0, 0.06),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: AppMotion.emphasizedDecelerate,
        ),
      );
      return FadeTransition(
        opacity: animation,
        child: SlideTransition(position: slide, child: child),
      );
    },
  );
}

class ScaffoldWithBottomNavigation extends ConsumerStatefulWidget {
  const ScaffoldWithBottomNavigation({super.key, required this.child});
  final Widget child;

  @override
  ConsumerState<ScaffoldWithBottomNavigation> createState() =>
      _ScaffoldWithBottomNavigationState();
}

class _ScaffoldWithBottomNavigationState
    extends ConsumerState<ScaffoldWithBottomNavigation> {
  int _indexFor(String location) {
    if (location.startsWith(AppRoutes.qibla)) return 1;
    if (location.startsWith(AppRoutes.more)) return 2;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final location = GoRouterState.of(context).uri.path;
    final currentIndex = _indexFor(location);

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          if (index == currentIndex) return;
          HapticFeedback.selectionClick();
          switch (index) {
            case 0:
              context.go(AppRoutes.home);
              break;
            case 1:
              context.go(AppRoutes.qibla);
              break;
            case 2:
              context.go(AppRoutes.more);
              break;
          }
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home_rounded),
            label: l.navHome,
          ),
          NavigationDestination(
            icon: const Icon(Icons.explore_outlined),
            selectedIcon: const Icon(Icons.explore_rounded),
            label: l.navQibla,
          ),
          NavigationDestination(
            icon: const Icon(Icons.more_horiz),
            selectedIcon: const Icon(Icons.more_horiz_rounded),
            label: l.navMore,
          ),
        ],
      ),
    );
  }
}
