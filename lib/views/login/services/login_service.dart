import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stacked_app/base/networking/dio_instance.dart';
import 'package:stacked_app/ui/common/t_url.dart';
import 'package:stacked_app/views/login/model/login_request_model.dart';

class LoginService {
  final dio = DioInstance().dio;
  Future<Response> postLogin(LoginRequestModel loginRequest) async {
    try {
      return await dio.post(TUrl.loginUrl,
          data: jsonEncode(loginRequest.toJson()));
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint('Response status: ${e.response?.statusCode}');
        debugPrint('Response data: ${e.response?.data}');
      } else {
        // Something went wrong before getting a response
        debugPrint('Error sending request: ${e.message}');
      }
      rethrow;
    }
  }
}
