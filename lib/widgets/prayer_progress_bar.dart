import 'package:flutter/material.dart';

import '../providers/prayer_timing_provider.dart';

/// Segmented urgency progress bar for a prayer window. Renders a track and a
/// filled progression colored per-segment (green/orange/red).
class PrayerProgressBar extends StatelessWidget {
  final List<ProgressSegment> segments;
  final double progress; // 0..1
  final double height;

  const PrayerProgressBar({
    super.key,
    required this.segments,
    required this.progress,
    this.height = 10,
  });

  Color _colorFor(PrayerUrgency urgency, ColorScheme cs) {
    switch (urgency) {
      case PrayerUrgency.green:
        return cs.primary;
      case PrayerUrgency.yellow:
        return Colors.orange.shade600;
      case PrayerUrgency.red:
        return cs.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return SizedBox(
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(height),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final filled = (progress * width).clamp(0.0, width);
            return Stack(
              children: [
                Container(
                  color: cs.surfaceContainerHighest,
                ),
                if (filled > 0)
                  ...segments.where((s) => s.start < progress).map((s) {
                    final segStart = s.start.clamp(0.0, progress);
                    final segEnd = s.end.clamp(0.0, progress);
                    final left = segStart * width;
                    final segW = (segEnd - segStart) * width;
                    final isRightEdge = segEnd >= progress - 1e-6;
                    return Positioned(
                      left: left,
                      top: 0,
                      bottom: 0,
                      width: segW,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        decoration: BoxDecoration(
                          color: _colorFor(s.urgency, cs),
                          borderRadius: isRightEdge
                              ? BorderRadius.only(
                                  topRight: Radius.circular(height),
                                  bottomRight: Radius.circular(height),
                                )
                              : BorderRadius.zero,
                        ),
                      ),
                    );
                  }),
              ],
            );
          },
        ),
      ),
    );
  }
}
