import 'package:flutter/material.dart';

import '../utils/loader_messages.dart';

/// Small loading line used under spinners. Picks a random witty/calm phrase
/// from `loaderMessages`. Optional [child] can be a label like "Fetching…".
class LoaderMessage extends StatelessWidget {
  final Widget? child;
  const LoaderMessage({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (child != null) ...[
          child!,
          const SizedBox(height: 6),
        ],
        Text(
          loaderMessages[DateTime.now().second % loaderMessages.length],
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
