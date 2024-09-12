import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/services/token_storage_service.dart';
import 'package:stacked_app/ui/views/login/login_view.form.dart';
import 'package:stacked_app/ui/views/login/model/login_request_model.dart';
import 'package:stacked_app/ui/views/login/repository/login_repository_implement.dart';

class LoginViewModel extends FormViewModel
    with $LoginView
    implements BaseViewModel {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  LoginRepositoryImplement loginRepo = LoginRepositoryImplement();

  //login function to login
  void requestLogin() async {
    //TextEditingController
    String trimmedEmail = usernameController.text.trim();
    String trimmedPassword = passwordController.text.trim();
    //passing TextEditingController to
    loginRepo.loginAuth(
        LoginRequestModel(email: trimmedEmail, password: trimmedPassword));

//
//Token Storage
    final tokenStorage = locator.get<TokenStorageService>();
    String? token = await tokenStorage.readToken();

    const Duration(milliseconds: 800);
    if (token != null) {
      passwordController.clear();

      debugPrint('Login successful, token: $token');
      dispose();
    }
    if (token == null) {
      passwordController.clear();

      //
      // Show an error message
      debugPrint('Login failed: $token');
    } else {}

    return null;
  }
}
