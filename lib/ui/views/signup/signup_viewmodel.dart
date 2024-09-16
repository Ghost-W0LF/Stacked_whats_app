import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/app/app.router.dart';
import 'package:stacked_app/services/cloud_firestore_service.dart';
import 'package:stacked_app/services/firebase_auth_service.dart';
import 'package:stacked_app/ui/views/signup/signup_repository/signup_repository_implements.dart';
import 'package:stacked_app/ui/views/signup/widgets/signup_form.form.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends FormViewModel with $SignupForm {
  final snackBar = locator<SnackbarService>();
  final navigation = locator<NavigationService>();
  final register = SignupRepositoryImplements();
  final registerFirebase = locator<FirebaseAuthService>();
  final cloudFireStore = locator<CloudFirestoreService>();
  void createAccount() async {
    try {
      final message = await registerFirebase.register(
          emailController.text, passwordController.text);
      if (message == 'success') {
        cloudFireStore.addData(fullnameController.text, emailController.text,
            passwordController.text);
        navigation.replaceWithHomeViewView();
        snackBar.showSnackbar(
            message: "Account created",
            duration: const Duration(milliseconds: 500));
      }
    } catch (e) {
      debugPrint("The error is:- $e");
    }
  }
}
