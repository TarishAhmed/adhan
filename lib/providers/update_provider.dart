import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/update_service.dart';

part 'update_provider.g.dart';

@riverpod
class UpdateNotifier extends _$UpdateNotifier {
  final UpdateService _updateService = UpdateService();

  @override
  Future<UpdateInfo?> build() async {
    await _updateService.initialize();
    return await _updateService.checkForUpdates();
  }

  Future<void> checkForUpdates() async {
    state = const AsyncValue.loading();
    try {
      final updateInfo = await _updateService.checkForUpdates();
      state = AsyncValue.data(updateInfo);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refreshRemoteConfig() async {
    await _updateService.refreshRemoteConfig();
    await checkForUpdates();
  }

  Future<bool> launchUpdate(String url) async {
    return await _updateService.launchUpdateUrl(url);
  }
}
