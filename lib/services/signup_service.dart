import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stacked_app/base/networking/dio_instance.dart';
import 'package:stacked_app/ui/common/t_url.dart';
import 'package:stacked_app/ui/views/login/model/signup_request_model.dart';

class SignupService {
  final dio = DioInstance().dio;

  Future<Response> registerUser(SignupRequestModel signupRequestModel) async {
    try {
      return await dio.post(TUrl.signUpUrl,
          data: jsonEncode(signupRequestModel.toJson()));
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
