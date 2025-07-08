import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../screens/prayer_times_screen.dart';
import '../screens/qibla_compass_screen.dart';
import '../screens/settings_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/prayer-times',

    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return ScaffoldWithBottomNavigation(child: child);
        },
        routes: [
          GoRoute(
            pageBuilder: (context, state) =>
                pageTransition(const PrayerTimesScreen(), state),
            path: '/prayer-times',
          ),
          GoRoute(
            pageBuilder: (context, state) =>
                pageTransition(const QiblaCompassScreen(), state),
            path: '/qibla-compass',
          ),
          GoRoute(
            pageBuilder: (context, state) =>
                pageTransition(const SettingsScreen(), state),
            path: '/settings',
          ),
        ],
      ),
    ],
  );
});

CustomTransitionPage<dynamic> pageTransition(
  Widget child,
  GoRouterState state,
) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
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
  int _currentIndex = 0;

  int _getCurrentIndex() {
    final location = GoRouterState.of(context).uri.path;
    switch (location) {
      case '/prayer-times':
        return 0;
      case '/qibla-compass':
        return 1;
      case '/settings':
        return 2;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    _currentIndex = _getCurrentIndex();

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        useLegacyColorScheme: false,
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        selectedLabelStyle: Theme.of(context).textTheme.labelMedium,
        unselectedLabelStyle: Theme.of(context).textTheme.labelSmall,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          switch (index) {
            case 0:
              context.go('/prayer-times');
              break;
            case 1:
              context.go('/qibla-compass');
              break;
            case 2:
              context.go('/settings');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            activeIcon: Icon(Icons.access_time_filled),

            label: 'Prayer Times',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            label: 'Qibla Compass',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
