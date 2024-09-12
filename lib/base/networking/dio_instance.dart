import 'package:dio/dio.dart';


class DioInstance {
  DioInstance() {
    // Add AuthInterceptor to Dio
    //dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(LogInterceptor());
  }
  final dio = Dio(BaseOptions());
}
