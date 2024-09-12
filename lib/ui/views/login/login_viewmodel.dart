import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel implements BaseViewModel{

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final _navigationService = NavigationService();
  void login() {
    _navigationService.navigateToHomeView();
  }
}
