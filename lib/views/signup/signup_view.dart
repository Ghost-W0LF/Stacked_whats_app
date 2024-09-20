import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/ui/common/app_strings.dart';
import 'package:stacked_app/views/signup/widgets/signup_form.dart';
import 'package:stacked_app/views/signup/widgets/signup_form.form.dart';
import 'package:stacked_app/widgets/cust_button.dart';

import 'signup_viewmodel.dart';

class SignupView extends StackedView<SignupViewModel> with $SignupForm {
  const SignupView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(signup),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.keyboard_return)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Text(
              signupYouCanCreat,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(
              height: 30,
            ),
            const SignupForm(),
            //
            //Signup button
            CustButton(
              text: creatAccount,
              onPressed: () {
                viewModel.createAccount();
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(SignupViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}
