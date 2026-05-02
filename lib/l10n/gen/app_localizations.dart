import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// Application title
  ///
  /// In en, this message translates to:
  /// **'Adhan'**
  String get appTitle;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navQibla.
  ///
  /// In en, this message translates to:
  /// **'Qibla'**
  String get navQibla;

  /// No description provided for @navMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get navMore;

  /// No description provided for @homeGreetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get homeGreetingMorning;

  /// No description provided for @homeGreetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get homeGreetingAfternoon;

  /// No description provided for @homeGreetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get homeGreetingEvening;

  /// No description provided for @homeGreetingNight.
  ///
  /// In en, this message translates to:
  /// **'Peaceful night'**
  String get homeGreetingNight;

  /// No description provided for @homeNextPrayerLabel.
  ///
  /// In en, this message translates to:
  /// **'Up next'**
  String get homeNextPrayerLabel;

  /// No description provided for @homeRefreshTooltip.
  ///
  /// In en, this message translates to:
  /// **'Refresh prayer times'**
  String get homeRefreshTooltip;

  /// No description provided for @homeRefreshSuccess.
  ///
  /// In en, this message translates to:
  /// **'Prayer times refreshed'**
  String get homeRefreshSuccess;

  /// No description provided for @homeRefreshFailure.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t refresh. Pull down to retry.'**
  String get homeRefreshFailure;

  /// No description provided for @homeQuickActionQibla.
  ///
  /// In en, this message translates to:
  /// **'Qibla'**
  String get homeQuickActionQibla;

  /// No description provided for @homeQuickActionNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get homeQuickActionNotifications;

  /// No description provided for @homeQuickActionLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get homeQuickActionLocation;

  /// No description provided for @loadingFetchingLocation.
  ///
  /// In en, this message translates to:
  /// **'Fetching location…'**
  String get loadingFetchingLocation;

  /// No description provided for @loadingFetchingPrayerTimes.
  ///
  /// In en, this message translates to:
  /// **'Fetching prayer times…'**
  String get loadingFetchingPrayerTimes;

  /// No description provided for @errorLocationGeneric.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t get your location'**
  String get errorLocationGeneric;

  /// No description provided for @errorLocationDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission denied'**
  String get errorLocationDenied;

  /// No description provided for @errorPrayerTimesGeneric.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load prayer times'**
  String get errorPrayerTimesGeneric;

  /// No description provided for @errorRetry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get errorRetry;

  /// No description provided for @qiblaTitle.
  ///
  /// In en, this message translates to:
  /// **'Qibla compass'**
  String get qiblaTitle;

  /// No description provided for @qiblaCalibrationTitle.
  ///
  /// In en, this message translates to:
  /// **'Calibration tips'**
  String get qiblaCalibrationTitle;

  /// No description provided for @qiblaCalibrationBody.
  ///
  /// In en, this message translates to:
  /// **'Move phone in a figure-8 motion, away from metal or magnets. Place it flat. Tilt: {tilt}°'**
  String qiblaCalibrationBody(String tilt);

  /// No description provided for @qiblaCompassUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Compass sensor not available on this device.'**
  String get qiblaCompassUnavailable;

  /// No description provided for @qiblaError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get qiblaError;

  /// No description provided for @moreSectionPrayer.
  ///
  /// In en, this message translates to:
  /// **'Prayer'**
  String get moreSectionPrayer;

  /// No description provided for @moreSectionAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get moreSectionAppearance;

  /// No description provided for @moreSectionAdvanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get moreSectionAdvanced;

  /// No description provided for @moreSectionAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get moreSectionAbout;

  /// No description provided for @moreNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get moreNotifications;

  /// No description provided for @moreNotificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage prayer time alerts'**
  String get moreNotificationsSubtitle;

  /// No description provided for @moreLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get moreLocation;

  /// No description provided for @moreLocationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Auto-detect or set a city manually'**
  String get moreLocationSubtitle;

  /// No description provided for @moreTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get moreTheme;

  /// No description provided for @moreLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get moreLanguage;

  /// No description provided for @moreBatteryOptimization.
  ///
  /// In en, this message translates to:
  /// **'Battery optimization'**
  String get moreBatteryOptimization;

  /// No description provided for @moreBackgroundService.
  ///
  /// In en, this message translates to:
  /// **'Background service'**
  String get moreBackgroundService;

  /// No description provided for @moreDatabase.
  ///
  /// In en, this message translates to:
  /// **'Cached data'**
  String get moreDatabase;

  /// No description provided for @moreHomeWidget.
  ///
  /// In en, this message translates to:
  /// **'Home screen widget'**
  String get moreHomeWidget;

  /// No description provided for @moreAbout.
  ///
  /// In en, this message translates to:
  /// **'About this app'**
  String get moreAbout;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @themeDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose theme'**
  String get themeDialogTitle;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @notificationsMasterToggle.
  ///
  /// In en, this message translates to:
  /// **'Prayer notifications'**
  String get notificationsMasterToggle;

  /// No description provided for @notificationsTestSound.
  ///
  /// In en, this message translates to:
  /// **'Test sound'**
  String get notificationsTestSound;

  /// No description provided for @notificationsAdvanceTime.
  ///
  /// In en, this message translates to:
  /// **'Advance time'**
  String get notificationsAdvanceTime;

  /// No description provided for @notificationsAdvanceTimeMinutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String notificationsAdvanceTimeMinutes(int minutes);

  /// No description provided for @notificationsDays.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get notificationsDays;

  /// No description provided for @notificationsSound.
  ///
  /// In en, this message translates to:
  /// **'Sound'**
  String get notificationsSound;

  /// No description provided for @notificationsSoundDefault.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get notificationsSoundDefault;

  /// No description provided for @notificationsTestButton.
  ///
  /// In en, this message translates to:
  /// **'Test notification'**
  String get notificationsTestButton;

  /// No description provided for @notificationsTestScheduled.
  ///
  /// In en, this message translates to:
  /// **'Test notification scheduled — fires in 2s'**
  String get notificationsTestScheduled;

  /// No description provided for @notificationsPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Notifications are disabled. Enable them to receive prayer alerts.'**
  String get notificationsPermissionRequired;

  /// No description provided for @notificationsEnableAction.
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get notificationsEnableAction;

  /// No description provided for @locationTitle.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get locationTitle;

  /// No description provided for @locationCurrentLabel.
  ///
  /// In en, this message translates to:
  /// **'Current location'**
  String get locationCurrentLabel;

  /// No description provided for @locationUseCurrent.
  ///
  /// In en, this message translates to:
  /// **'Use current location'**
  String get locationUseCurrent;

  /// No description provided for @locationAutoToggle.
  ///
  /// In en, this message translates to:
  /// **'Auto-detect location'**
  String get locationAutoToggle;

  /// No description provided for @locationSearchLabel.
  ///
  /// In en, this message translates to:
  /// **'Search city'**
  String get locationSearchLabel;

  /// No description provided for @locationSearchHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Mecca, London, Karachi'**
  String get locationSearchHint;

  /// No description provided for @locationSearchEmpty.
  ///
  /// In en, this message translates to:
  /// **'No matches found'**
  String get locationSearchEmpty;

  /// No description provided for @locationLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated: {when}'**
  String locationLastUpdated(String when);

  /// No description provided for @onboardingWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Adhan'**
  String get onboardingWelcomeTitle;

  /// No description provided for @onboardingWelcomeBody.
  ///
  /// In en, this message translates to:
  /// **'Accurate prayer times, Qibla direction, and gentle reminders — wherever you are.'**
  String get onboardingWelcomeBody;

  /// No description provided for @onboardingLocationTitle.
  ///
  /// In en, this message translates to:
  /// **'Allow location'**
  String get onboardingLocationTitle;

  /// No description provided for @onboardingLocationBody.
  ///
  /// In en, this message translates to:
  /// **'We use your location to calculate accurate prayer times and Qibla direction. Nothing leaves your device.'**
  String get onboardingLocationBody;

  /// No description provided for @onboardingLocationCta.
  ///
  /// In en, this message translates to:
  /// **'Allow location'**
  String get onboardingLocationCta;

  /// No description provided for @onboardingNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Allow notifications'**
  String get onboardingNotificationsTitle;

  /// No description provided for @onboardingNotificationsBody.
  ///
  /// In en, this message translates to:
  /// **'Get a quiet, customizable adhan when each prayer time arrives.'**
  String get onboardingNotificationsBody;

  /// No description provided for @onboardingNotificationsCta.
  ///
  /// In en, this message translates to:
  /// **'Allow notifications'**
  String get onboardingNotificationsCta;

  /// No description provided for @onboardingSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// No description provided for @onboardingNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// No description provided for @onboardingGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get onboardingGetStarted;

  /// No description provided for @commonClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get commonClose;

  /// No description provided for @commonOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get commonOk;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @commonRefresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get commonRefresh;

  /// No description provided for @commonSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get commonSave;

  /// No description provided for @commonDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get commonDelete;

  /// No description provided for @commonRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get commonRetry;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
