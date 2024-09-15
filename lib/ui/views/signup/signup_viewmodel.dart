import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/services/firebase_auth_service.dart';
import 'package:stacked_app/ui/views/login/model/signup_request_model.dart';
import 'package:stacked_app/ui/views/signup/signup_repository/signup_repository_implements.dart';
import 'package:stacked_app/ui/views/signup/widgets/signup_form.form.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends FormViewModel with $SignupForm {
  final snackBar = locator<SnackbarService>();
  final register = SignupRepositoryImplements();
  final registerFirebase = locator<FirebaseAuthService>();
  void createAccount() {
    try {
      registerFirebase.register(emailController.text, passwordController.text);
      //register using thuprai's api
      /* register.signupAuth(SignupRequestModel(
          email: emailController.text,
          password: passwordController.text,
          userName: fullnameController.text)); */
      snackBar.showSnackbar(message: "Processing Data");
    } catch (e) {
      debugPrint("The error is:- $e");
    }
  }
}
