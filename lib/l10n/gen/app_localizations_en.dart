// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Adhan';

  @override
  String get navHome => 'Home';

  @override
  String get navQibla => 'Qibla';

  @override
  String get navMore => 'More';

  @override
  String get homeGreetingMorning => 'Good morning';

  @override
  String get homeGreetingAfternoon => 'Good afternoon';

  @override
  String get homeGreetingEvening => 'Good evening';

  @override
  String get homeGreetingNight => 'Peaceful night';

  @override
  String get homeNextPrayerLabel => 'Up next';

  @override
  String get homeRefreshTooltip => 'Refresh prayer times';

  @override
  String get homeRefreshSuccess => 'Prayer times refreshed';

  @override
  String get homeRefreshFailure => 'Couldn\'t refresh. Pull down to retry.';

  @override
  String get homeQuickActionQibla => 'Qibla';

  @override
  String get homeQuickActionNotifications => 'Notifications';

  @override
  String get homeQuickActionLocation => 'Location';

  @override
  String get loadingFetchingLocation => 'Fetching location…';

  @override
  String get loadingFetchingPrayerTimes => 'Fetching prayer times…';

  @override
  String get errorLocationGeneric => 'Couldn\'t get your location';

  @override
  String get errorLocationDenied => 'Location permission denied';

  @override
  String get errorPrayerTimesGeneric => 'Couldn\'t load prayer times';

  @override
  String get errorRetry => 'Try again';

  @override
  String get qiblaTitle => 'Qibla compass';

  @override
  String get qiblaCalibrationTitle => 'Calibration tips';

  @override
  String qiblaCalibrationBody(String tilt) {
    return 'Move phone in a figure-8 motion, away from metal or magnets. Place it flat. Tilt: $tilt°';
  }

  @override
  String get qiblaCompassUnavailable =>
      'Compass sensor not available on this device.';

  @override
  String get qiblaError => 'Error';

  @override
  String get moreSectionPrayer => 'Prayer';

  @override
  String get moreSectionAppearance => 'Appearance';

  @override
  String get moreSectionAdvanced => 'Advanced';

  @override
  String get moreSectionAbout => 'About';

  @override
  String get moreNotifications => 'Notifications';

  @override
  String get moreNotificationsSubtitle => 'Manage prayer time alerts';

  @override
  String get moreLocation => 'Location';

  @override
  String get moreLocationSubtitle => 'Auto-detect or set a city manually';

  @override
  String get moreTheme => 'Theme';

  @override
  String get moreLanguage => 'Language';

  @override
  String get moreBatteryOptimization => 'Battery optimization';

  @override
  String get moreBackgroundService => 'Background service';

  @override
  String get moreDatabase => 'Cached data';

  @override
  String get moreHomeWidget => 'Home screen widget';

  @override
  String get moreAbout => 'About this app';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeDialogTitle => 'Choose theme';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get notificationsMasterToggle => 'Prayer notifications';

  @override
  String get notificationsTestSound => 'Test sound';

  @override
  String get notificationsAdvanceTime => 'Advance time';

  @override
  String notificationsAdvanceTimeMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get notificationsDays => 'Days';

  @override
  String get notificationsSound => 'Sound';

  @override
  String get notificationsSoundDefault => 'Default';

  @override
  String get notificationsTestButton => 'Test notification';

  @override
  String get notificationsTestScheduled =>
      'Test notification scheduled — fires in 2s';

  @override
  String get notificationsPermissionRequired =>
      'Notifications are disabled. Enable them to receive prayer alerts.';

  @override
  String get notificationsEnableAction => 'Enable';

  @override
  String get locationTitle => 'Location';

  @override
  String get locationCurrentLabel => 'Current location';

  @override
  String get locationUseCurrent => 'Use current location';

  @override
  String get locationAutoToggle => 'Auto-detect location';

  @override
  String get locationSearchLabel => 'Search city';

  @override
  String get locationSearchHint => 'e.g. Mecca, London, Karachi';

  @override
  String get locationSearchEmpty => 'No matches found';

  @override
  String locationLastUpdated(String when) {
    return 'Last updated: $when';
  }

  @override
  String get onboardingWelcomeTitle => 'Welcome to Adhan';

  @override
  String get onboardingWelcomeBody =>
      'Accurate prayer times, Qibla direction, and gentle reminders — wherever you are.';

  @override
  String get onboardingLocationTitle => 'Allow location';

  @override
  String get onboardingLocationBody =>
      'We use your location to calculate accurate prayer times and Qibla direction. Nothing leaves your device.';

  @override
  String get onboardingLocationCta => 'Allow location';

  @override
  String get onboardingNotificationsTitle => 'Allow notifications';

  @override
  String get onboardingNotificationsBody =>
      'Get a quiet, customizable adhan when each prayer time arrives.';

  @override
  String get onboardingNotificationsCta => 'Allow notifications';

  @override
  String get onboardingSkip => 'Skip';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingGetStarted => 'Get started';

  @override
  String get commonClose => 'Close';

  @override
  String get commonOk => 'OK';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonRefresh => 'Refresh';

  @override
  String get commonSave => 'Save';

  @override
  String get commonDelete => 'Delete';

  @override
  String get commonRetry => 'Retry';
}
