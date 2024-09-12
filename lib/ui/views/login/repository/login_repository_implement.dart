import 'package:flutter/material.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/app/app.router.dart';
import 'package:stacked_app/base/networking/dio_instance.dart';
import 'package:stacked_app/services/login_service.dart';
import 'package:stacked_app/services/token_storage_service.dart';
import 'package:stacked_app/ui/views/login/model/login_request_model.dart';
import 'package:stacked_app/ui/views/login/repository/login_repository.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginRepositoryImplement implements LoginRepository {
  final tokenStorage = locator.get<TokenStorageService>();
  final snackBar = locator.get<SnackbarService>();
  final dio = DioInstance().dio;
  final _navigation = locator.get<NavigationService>();
  final loginService = locator.get<LoginService>();
  @override
  Future<String?> loginAuth(LoginRequestModel loginRequest) async {
    final response = await loginService.postLogin(loginRequest);

    try {
      if (response.statusCode == 200) {
        String token = response.data['token'];
        debugPrint('The token is $token');
        tokenStorage.writeToken(token);
        _navigation.navigateToHomeViewView();
//Snackbar
        snackBar.showSnackbar(
            message: "Processing Data",
            duration: const Duration(milliseconds: 300));
        return token;
      } else {
        debugPrint('Login failed: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint("The error is: $e");
    }
    return null;
  }
}
