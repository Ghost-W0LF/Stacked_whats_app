import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_app/ui/common/app_strings.dart';
import 'package:stacked_app/ui/common/validator/text_form_validator.dart';
import 'package:stacked_app/views/login/widgets/login_footer.dart';
import 'package:stacked_app/views/login/widgets/login_form.dart';
import 'package:stacked_app/views/login/widgets/login_headder.dart';
import 'package:stacked_app/widgets/cust_button.dart';
import 'package:stacked_app/widgets/cust_divider.dart';

import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'username',
    validator: TextFormValidators.emailValidators,
  ),
  FormTextField(
    name: 'Password',
    validator: TextFormValidators.passwordValidators,
  )
])
class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 90),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //
        //Login headder
        //Logo,Title text,Subtitle TExt
        const LoginHeadder(),

        const SizedBox(height: 30),

        //
        //Login Form
        const LoginForm(),
        //
        //Login button
        const SizedBox(height: 30),
        CustButton(
          text: login,
          //
          //
          //on pressed method
          onPressed: () {
            viewModel.requestLogin();
          },
        ),
        //
        //Divider
        const SizedBox(height: 30),
        const CustDivider(),
        //

        //Footer
        const SizedBox(height: 20),
        const LoginFooter()
      ]),
    ));
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
