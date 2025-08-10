import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

/// Orchestrates rescheduling without introducing import cycles.
/// Other services set a flag and optionally enqueue a WorkManager task handled
/// by the background callback to perform the actual reschedule.
class RescheduleService {
  static const String _needsRescheduleKey = 'needs_reschedule';
  static const String _rescheduleTask = 'rescheduleAll';

  /// Mark that notifications and background tasks should be rescheduled.
  static Future<void> markNeedsReschedule() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_needsRescheduleKey, true);
  }

  /// Clear the reschedule flag.
  static Future<void> clearNeedsReschedule() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_needsRescheduleKey);
  }

  /// Whether reschedule is pending.
  static Future<bool> getNeedsReschedule() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_needsRescheduleKey) ?? false;
  }

  /// Enqueue a near-immediate background reschedule task. Requires Workmanager
  /// to be initialized (done during app startup).
  static Future<void> enqueueImmediateReschedule({Duration? delay}) async {
    await Workmanager().registerOneOffTask(
      _rescheduleTask,
      _rescheduleTask,
      existingWorkPolicy: ExistingWorkPolicy.replace,
      initialDelay: delay ?? const Duration(seconds: 5),
    );
  }
}
