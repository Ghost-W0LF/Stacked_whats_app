import 'package:dio/dio.dart';
import 'package:stacked_app/base/networking/interceptor/auth_interceptor.dart';

class DioInstance {
  DioInstance() {
    // Add AuthInterceptor to Dio
    dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(LogInterceptor());
  }
  final dio = Dio(BaseOptions());
}
