import 'dart:developer';
import 'dart:io';

import 'package:adhan_app/services/battery_optimization_service.dart';

class SoundUtils {
  /// Takes a file path and returns a content:// URI.
  ///
  /// This method calls native Android code to copy the audio file
  /// to a shared space and register it with the MediaStore,
  /// which generates a content:// URI.
  static Future<String?> getSoundUri(String filePath) async {
    // The 'getUriForFile' is the name of the method we will define in the native code.
    // We pass the file path as an argument.
    final String? uri = await systemUtilsChannel
        .invokeMethod('getUriForFile', {'path': filePath})
        .catchError((e, stack) {
          log('Error getting sound URI: $e', error: e, stackTrace: stack);
          throw Exception('Failed to get sound URI: $e');
        });
    return uri;
  }
}

Future<File?> findFileWithExtension(String directoryPath, String baseName) async {
  final dir = Directory(directoryPath);
  if (await dir.exists()) {
    final files = dir.listSync();
    for (final entity in files) {
      if (entity is File) {
        final name = entity.uri.pathSegments.last;
        if (name.startsWith(baseName)) {
          return File(entity.path);
        }
      }
    }
  }
  return null; // Not found
}

const String athanMp3Repo =
    'https://raw.githubusercontent.com/TarishAhmed/Athan-MP3/master/Sounds/';

enum AdhanAudioLibrary {
  defaultNotification(
    url: 'defaultNotificationSound',
    displayName: 'Default Notification Sound',
    internal: true,
  ),
  makkah(url: '${athanMp3Repo}Athan%20Makkah.mp3', displayName: 'Makkah'),
  misharyAlafasi(
    url: '${athanMp3Repo}Athan%20Mishary%20Alafasi.mp3',
    displayName: 'Mishary Alafasi',
  ),
  mansoorAzZahrani(
    url: '${athanMp3Repo}Athan%20Mansoor%20Az-Zahrani.mp3',
    displayName: 'Mansoor Az-Zahrani',
  ),
  hamdanAlmalki(
    url: '${athanMp3Repo}Athan%20Hamdan%20Almalki.mp3',
    displayName: 'Hamdan Almalki',
  ),
  hamadDeghreri(
    url: '${athanMp3Repo}Athan%20Hamad%20Deghreri.mp3',
    displayName: 'Hamad Deghreri',
  ),
  ibrahimAlArkani(
    url: '${athanMp3Repo}Athan%20Ibrahim%20Al-Arkani.mp3',
    displayName: 'Ibrahim Al-Arkani',
  ),
  majedAlHamathani(
    url: '${athanMp3Repo}Athan%20Majed%20Al-hamathani.mp3',
    displayName: 'Majed Al-Hamathani',
  ),
  malekChebaeFajr(
    url: '${athanMp3Repo}Athan%20Al-fajer%20-%20Malek%20chebae.mp3',
    displayName: 'Malek Chebae (Fajr)',
  ),
  mohammadAlmenshawy(
    url: '${athanMp3Repo}Athan%20Mohammad%20Almenshawy.mp3',
    displayName: 'Mohammad Almenshawy',
  ),
  mohammadRefat(
    url: '${athanMp3Repo}Athan%20Mohammad%20Ref3at.mp3',
    displayName: "Mohammad Ref'at",
  ),
  nasserAlqatami(
    url: '${athanMp3Repo}Athan%20Nasser%20Alqatami.mp3',
    displayName: 'Nasser Alqatami',
  ),
  suhaibKhatba(
    url: '${athanMp3Repo}Athan%20Suhaib%20Khatba.mp3',
    displayName: 'Suhaib Khatba',
  ),
  abedAlbase(
    url: '${athanMp3Repo}Athan%20Abed%20Albase6.mp3',
    displayName: 'Abed Albase',
  ),
  ahmadNuyne(
    url: '${athanMp3Repo}Athan%20Ahmad%20Nuyne3.mp3',
    displayName: 'Ahmad Nuyne',
  );

  const AdhanAudioLibrary({
    required this.url,
    required this.displayName,
    this.internal = false,
  });

  final String url;

  final String displayName;

  final bool internal;

  static AdhanAudioLibrary defaultAdhan = makkah;
}
