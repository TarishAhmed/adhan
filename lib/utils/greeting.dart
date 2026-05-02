import 'package:flutter/widgets.dart';

import '../l10n/gen/app_localizations.dart';

/// Returns a localized time-of-day greeting.
String greetingFor(BuildContext context, [DateTime? now]) {
  final l = AppLocalizations.of(context);
  final hour = (now ?? DateTime.now()).hour;
  if (hour < 5) return l.homeGreetingNight;
  if (hour < 12) return l.homeGreetingMorning;
  if (hour < 17) return l.homeGreetingAfternoon;
  if (hour < 21) return l.homeGreetingEvening;
  return l.homeGreetingNight;
}
