import 'package:flutter/material.dart';

/// Spacing scale (logical pixels). Use these instead of inlining numbers.
abstract final class AppSpacing {
  static const double xxs = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double xxxl = 32;
  static const double huge = 48;
}

/// Corner radius scale.
abstract final class AppRadius {
  static const Radius xs = Radius.circular(4);
  static const Radius sm = Radius.circular(8);
  static const Radius md = Radius.circular(12);
  static const Radius lg = Radius.circular(16);
  static const Radius xl = Radius.circular(24);
  static const Radius xxl = Radius.circular(32);

  static const BorderRadius allXs = BorderRadius.all(xs);
  static const BorderRadius allSm = BorderRadius.all(sm);
  static const BorderRadius allMd = BorderRadius.all(md);
  static const BorderRadius allLg = BorderRadius.all(lg);
  static const BorderRadius allXl = BorderRadius.all(xl);
  static const BorderRadius allXxl = BorderRadius.all(xxl);
}

/// Motion durations & curves following M3 Expressive guidelines.
abstract final class AppMotion {
  // Durations
  static const Duration short1 = Duration(milliseconds: 50);
  static const Duration short2 = Duration(milliseconds: 100);
  static const Duration short3 = Duration(milliseconds: 150);
  static const Duration short4 = Duration(milliseconds: 200);
  static const Duration medium1 = Duration(milliseconds: 250);
  static const Duration medium2 = Duration(milliseconds: 300);
  static const Duration medium3 = Duration(milliseconds: 350);
  static const Duration medium4 = Duration(milliseconds: 400);
  static const Duration long1 = Duration(milliseconds: 450);
  static const Duration long2 = Duration(milliseconds: 500);
  static const Duration long3 = Duration(milliseconds: 550);
  static const Duration long4 = Duration(milliseconds: 600);

  // M3 easing curves
  static const Curve standard = Easing.standard;
  static const Curve standardAccelerate = Easing.standardAccelerate;
  static const Curve standardDecelerate = Easing.standardDecelerate;
  static const Curve emphasizedAccelerate = Easing.emphasizedAccelerate;
  static const Curve emphasizedDecelerate = Easing.emphasizedDecelerate;

  /// Emphasized easing — composite curve approximation per M3 spec.
  /// (Real spec is a piecewise curve; this approximates the in/out feel.)
  static const Curve emphasized = Cubic(0.2, 0.0, 0.0, 1.0);

  /// Spring-like curve for expressive surface emphasis.
  static const Curve expressiveSpring = Cubic(0.2, 0.8, 0.2, 1.0);
}

/// Convenience EdgeInsets aligned to the spacing scale.
abstract final class AppPadding {
  static const EdgeInsets allSm = EdgeInsets.all(AppSpacing.sm);
  static const EdgeInsets allMd = EdgeInsets.all(AppSpacing.md);
  static const EdgeInsets allLg = EdgeInsets.all(AppSpacing.lg);
  static const EdgeInsets allXl = EdgeInsets.all(AppSpacing.xl);

  static const EdgeInsets hSm = EdgeInsets.symmetric(horizontal: AppSpacing.sm);
  static const EdgeInsets hMd = EdgeInsets.symmetric(horizontal: AppSpacing.md);
  static const EdgeInsets hLg = EdgeInsets.symmetric(horizontal: AppSpacing.lg);

  static const EdgeInsets vSm = EdgeInsets.symmetric(vertical: AppSpacing.sm);
  static const EdgeInsets vMd = EdgeInsets.symmetric(vertical: AppSpacing.md);
  static const EdgeInsets vLg = EdgeInsets.symmetric(vertical: AppSpacing.lg);
}
