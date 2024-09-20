import 'package:flutter/material.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/app/app.router.dart';
import 'package:stacked_app/base/networking/dio_instance.dart';
import 'package:stacked_app/ui/views/signup/service/signup_service.dart';
import 'package:stacked_app/ui/views/signup/model/signup_request_model.dart';
import 'package:stacked_app/ui/views/signup/signup_repository/signup_repository.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupRepositoryImplements implements SignupRepository {
  final dio = DioInstance().dio;
  final signupService = locator<SignupService>();
  final navigation = locator<NavigationService>();
  @override
  Future<void> signupAuth(SignupRequestModel signupRequestModel) async {
    final response = await signupService.registerUser(signupRequestModel);
    try {
      if (response.statusCode == 200) {
        final data = response.data;
        debugPrint('User ID: ${data['full_name']}');
        navigation.replaceWithHomeViewView();
        debugPrint("Register Success");
      } else {
        debugPrint("Register Failed");
        debugPrint('Login failed: ${response.statusCode}  ${response.data}');
      }
    } catch (e) {
      debugPrint('Login failed: $e');
    }
  }
}
