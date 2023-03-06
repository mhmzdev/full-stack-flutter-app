import 'package:client/services/urls.dart';
import 'package:dio/dio.dart';

class Api {
  static final BaseOptions _options = BaseOptions(
    baseUrl: URLs.baseUrl(isProd: false),
    contentType: "application/json",
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  );

  static final Dio _ins = Dio(_options);
  static Dio get ins => Api._ins;
}
