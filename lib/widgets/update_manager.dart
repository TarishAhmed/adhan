import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/update_provider.dart';
import '../services/update_service.dart';
import 'force_update_screen.dart';
import 'update_dialog.dart';

class UpdateManager extends ConsumerStatefulWidget {
  final Widget child;

  const UpdateManager({super.key, required this.child});

  @override
  ConsumerState<UpdateManager> createState() => _UpdateManagerState();
}

class _UpdateManagerState extends ConsumerState<UpdateManager> {
  bool _hasShownGeneralUpdate = false;

  @override
  void initState() {
    super.initState();
    // Check for updates when the widget initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkForUpdates();
    });
  }

  Future<void> _checkForUpdates() async {
    final updateNotifier = ref.read(updateNotifierProvider.notifier);
    await updateNotifier.checkForUpdates();
  }

  @override
  Widget build(BuildContext context) {
    final updateAsync = ref.watch(updateNotifierProvider);

    return updateAsync.when(
      data: (updateInfo) {
        if (updateInfo == null) {
          return widget.child;
        }

        // Handle force update
        if (updateInfo.type == UpdateType.force) {
          return ForceUpdateScreen(updateInfo: updateInfo);
        }

        // Handle general update (show dialog once)
        if (updateInfo.type == UpdateType.general && !_hasShownGeneralUpdate) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _hasShownGeneralUpdate = true;
            _showGeneralUpdateDialog(updateInfo);
          });
        }

        return widget.child;
      },
      loading: () => widget.child,
      error: (error, stackTrace) {
        // Log error but don't block the app
        debugPrint('Update check error: $error');
        return widget.child;
      },
    );
  }

  void _showGeneralUpdateDialog(UpdateInfo updateInfo) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => UpdateDialog(
        updateInfo: updateInfo,
        onDismiss: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
