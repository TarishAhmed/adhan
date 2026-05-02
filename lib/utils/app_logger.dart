import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

/// Lightweight logging helper. Routes through `dart:developer.log` so output
/// appears in the IDE/devtools log viewer with proper severity, and is gated
/// behind `kDebugMode` for verbose levels so release builds stay quiet.
abstract final class AppLogger {
  /// Verbose / trace messages. Debug builds only.
  static void v(String message, {String name = 'adhan'}) {
    if (!kDebugMode) return;
    developer.log(message, name: name, level: 500);
  }

  /// Informational. Debug builds only.
  static void i(String message, {String name = 'adhan'}) {
    if (!kDebugMode) return;
    developer.log(message, name: name, level: 800);
  }

  /// Warnings. Always logged.
  static void w(
    String message, {
    String name = 'adhan',
    Object? error,
    StackTrace? stackTrace,
  }) {
    developer.log(
      message,
      name: name,
      level: 900,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Errors. Always logged.
  static void e(
    String message, {
    String name = 'adhan',
    Object? error,
    StackTrace? stackTrace,
  }) {
    developer.log(
      message,
      name: name,
      level: 1000,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
