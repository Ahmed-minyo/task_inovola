import 'package:dio/dio.dart';

Dio dio() {
  Dio dio = Dio();
  dio.options.baseUrl = "https://run.mocky.io/v3/";
  dio.options.connectTimeout = 20000;
  dio.options.validateStatus = (status) {
    return status! < 500;
  };
  dio.interceptors.add(
    LogInterceptor(
        // responseBody: true,
        // error: true,
        // requestBody: true,
        // requestHeader: true,
        // request: true,
        // responseHeader: true
        ),
  );
  return dio;
}
