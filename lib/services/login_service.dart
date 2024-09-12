import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:stacked_app/base/networking/dio_instance.dart';
import 'package:stacked_app/ui/common/t_url.dart';
import 'package:stacked_app/ui/views/login/model/login_request_model.dart';

class LoginService {
  final dio = DioInstance().dio;
  Future<Response> postLogin(LoginRequestModel loginRequest) async {

    return await dio.post(TUrl.loginUrl,
        data: jsonEncode(loginRequest.toJson()));
  }
}
