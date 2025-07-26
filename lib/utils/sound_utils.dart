import 'dart:developer';

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
    final String? uri = await systemUtilsChannel.invokeMethod('getUriForFile', {'path': filePath}).catchError((
      e,
      stack,
    ) {
      log('Error getting sound URI: $e', error: e, stackTrace: stack);
      throw Exception('Failed to get sound URI: $e');
    });
    return uri;
  }
}

const String aladhanAudioRepo = 'https://cdn.aladhan.com/audio/adhans/';

const String alislamRepo = 'https://alislam.org/adhan/';

enum AdhanAudioLibrary {
  ferozAlam(url: '${alislamRepo}Azan_FerozAlam.mp3', displayName: 'Feroz Alam'),
  misharyRashidAlafasy(url: '${aladhanAudioRepo}a4.mp3', displayName: 'Mishary Rashid Alafasy'),
  misharyRashidAlafasy2(url: '${aladhanAudioRepo}a7.mp3', displayName: 'Mishary Rashid Alafasy 2'),
  misharyRashidAlafasy3(url: '${aladhanAudioRepo}a9.mp3', displayName: 'Mishary Rashid Alafasy 3'),
  mansourAlZahrani(url: '${aladhanAudioRepo}a11-mansour-al-zahrani.mp3', displayName: 'Mansour Al Zahrani'),
  hafizMustafaOzcan(url: '${aladhanAudioRepo}a2.mp3', displayName: 'Hafiz Mustafa Ozcan'),
  karlJenkins(url: '${aladhanAudioRepo}a3.mp3', displayName: 'Karl Jenkins'),
  ahmadAlNafees(url: '${aladhanAudioRepo}a1.mp3', displayName: 'Ahmad Al Nafees');

  const AdhanAudioLibrary({required this.url, required this.displayName});

  final String url;

  final String displayName;
}
