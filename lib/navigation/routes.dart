/// Centralized route paths for the app. Use these instead of string literals
/// to keep navigation references type-checked and refactor-safe.
abstract final class AppRoutes {
  // Top-level / shell tabs.
  static const String home = '/home';
  static const String qibla = '/qibla';
  static const String more = '/more';

  // Pushed routes under /more.
  static const String notifications = '/more/notifications';
  static const String location = '/more/location';
  static const String appearance = '/more/appearance';
  static const String advanced = '/more/advanced';
  static const String about = '/more/about';

  // Onboarding.
  static const String onboarding = '/onboarding';
}
