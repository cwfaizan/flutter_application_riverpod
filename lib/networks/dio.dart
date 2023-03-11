import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'environment_config.dart';

// 2. add a part file
part 'dio.g.dart';

// 3. use the @riverpod annotation
@riverpod
Dio dio(DioRef ref) {
  Dio dio = Dio(BaseOptions(
    // receiveTimeout: 20000,
    // connectTimeout: 30000,
    baseUrl: EnvironmentConfig.baseUrl,
    maxRedirects: 2,
  ));

  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    error: true,
    request: false,
    requestHeader: false,
    responseBody: true,
    responseHeader: false,
  ));
  return dio;
}
