import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

enum UpdateType { none, general, force }

class UpdateInfo {
  final UpdateType type;
  final String version;
  final String url;

  UpdateInfo({required this.type, required this.version, required this.url});
}

class UpdateService {
  static final UpdateService _instance = UpdateService._internal();
  factory UpdateService() => _instance;
  UpdateService._internal();

  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> initialize() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );

    await _remoteConfig.setDefaults({
      'force_update_version': '1.0.0',
      'force_update_url': '',
      'general_update_version': '1.0.0',
      'general_update_url': '',
    });

    await _remoteConfig.fetchAndActivate();
  }

  Future<UpdateInfo> checkForUpdates() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;

    final forceUpdateVersion = _remoteConfig.getString('force_update_version');
    final forceUpdateUrl = _remoteConfig.getString('force_update_url');
    final generalUpdateVersion = _remoteConfig.getString(
      'general_update_version',
    );
    final generalUpdateUrl = _remoteConfig.getString('general_update_url');

    // Check if force update is required
    if (isVersionHigher(forceUpdateVersion, currentVersion)) {
      return UpdateInfo(
        type: UpdateType.force,
        version: forceUpdateVersion,
        url: forceUpdateUrl,
      );
    }

    // Check if general update is available
    if (isVersionHigher(generalUpdateVersion, currentVersion)) {
      return UpdateInfo(
        type: UpdateType.general,
        version: generalUpdateVersion,
        url: generalUpdateUrl,
      );
    }

    return UpdateInfo(type: UpdateType.none, version: currentVersion, url: '');
  }

  bool isVersionHigher(String newVersion, String currentVersion) {
    if (newVersion.isEmpty || currentVersion.isEmpty) return false;

    final newParts = newVersion.split('.');
    final currentParts = currentVersion.split('.');

    // Ensure both versions have at least 3 parts (major.minor.patch)
    while (newParts.length < 3) newParts.add('0');
    while (currentParts.length < 3) currentParts.add('0');

    for (int i = 0; i < 3; i++) {
      final newPart = int.tryParse(newParts[i]) ?? 0;
      final currentPart = int.tryParse(currentParts[i]) ?? 0;

      if (newPart > currentPart) return true;
      if (newPart < currentPart) return false;
    }

    return false;
  }

  Future<bool> launchUpdateUrl(String url) async {
    if (url.isEmpty) return false;

    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      return await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
    return false;
  }

  Future<void> refreshRemoteConfig() async {
    await _remoteConfig.fetchAndActivate();
  }
}
