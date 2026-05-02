import 'package:hijri/hijri_calendar.dart';

/// Returns a Hijri date string for the given [date], or null on failure.
/// Uses the tabular Umm al-Qura conversion (no moon-sighting); UI should
/// label this as approximate.
String? formatHijri(DateTime date) {
  try {
    final h = HijriCalendar.fromDate(date);
    return '${h.hDay} ${h.longMonthName} ${h.hYear} AH';
  } catch (_) {
    return null;
  }
}
