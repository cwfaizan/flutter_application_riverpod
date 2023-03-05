import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 2. add a part file
part 'dio.g.dart';

// 3. use the @riverpod annotation
@riverpod
Dio dio(DioRef ref) {
  return Dio();
}