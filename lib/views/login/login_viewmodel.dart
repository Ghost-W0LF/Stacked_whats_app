import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/app/app.router.dart';
import 'package:stacked_app/views/chat_details/service/cloud_firestore_service.dart';
import 'package:stacked_app/views/login/services/firebase_auth_service.dart';
import 'package:stacked_app/views/login/login_view.form.dart';
import 'package:stacked_app/views/login/repository/login_repository_implement.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel
    with $LoginView
    implements BaseViewModel {
  LoginRepositoryImplement loginRepo = LoginRepositoryImplement();
  final snackBar = locator<SnackbarService>();
  final firebaseLogin = locator<FirebaseAuthService>();
  final _navigation = locator<NavigationService>();
  final fireStore = locator<CloudFirestoreService>();

  //login function to login
  void requestLogin() async {
    //TextEditingController
    String trimmedEmail = usernameController.text.trim();
    String trimmedPassword = passwordController.text.trim();

    final message = await firebaseLogin.login(trimmedEmail, trimmedPassword);
    debugPrint('The message is:-$message ');

    if (message == 'success') {
      _navigation.replaceWithHomeViewView();
    } else {
      snackBar.showSnackbar(
          message: '$message \n Invalid Email or Password',
          duration: const Duration(seconds: 1));
    }
  }
}
