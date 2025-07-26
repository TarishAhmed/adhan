import 'package:dio/dio.dart';
class ApiHelper {
  static ApiHelper? _instance;
  late final Dio dio;

  ApiHelper._() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    initialize();
  }

  static ApiHelper get instance {
    _instance ??= ApiHelper._();
    return _instance!;
  }

  /// Initializes the Dio instance with default settings.
  void initialize() {
    dio.interceptors.add(LogInterceptor(responseBody: true)); // Optional: for logging requests and responses
  }
}
