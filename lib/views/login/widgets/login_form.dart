import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/ui/common/app_strings.dart';
import 'package:stacked_app/ui/common/validator/text_form_validator.dart';
import 'package:stacked_app/views/login/login_view.form.dart';
import 'package:stacked_app/views/login/login_viewmodel.dart';
import 'package:stacked_app/widgets/cust_text_formfield.dart';

class LoginForm extends StackedView<LoginViewModel> with $LoginView {
  const LoginForm({
    super.key,
  });

  @override
  Widget builder(
      BuildContext context, LoginViewModel viewModel, Widget? child) {
    return Form(
        //  key: _loginFormKey,
        child: Column(
      children: [
        //
        //eamil

        CustTextFormField(
          controller: usernameController,
          hintText: email,
          iconData: Icons.email,
          validator: TextFormValidators.emailValidators,
        ),

        if (viewModel.hasUsernameValidationMessage) ...[
          Text(
            viewModel.usernameValidationMessage!,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          )
        ],

        const SizedBox(height: 30),
        //
        //
        //password
        CustTextFormField(
          controller: passwordController,
          obscureText: true,
          hintText: password,
          iconData: Icons.password,
        ),
        if (viewModel.hasPasswordValidationMessage) ...[
          Text(
            viewModel.passwordValidationMessage!,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          )
        ]
      ],
    ));
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
