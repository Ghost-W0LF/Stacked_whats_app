import 'package:flutter/material.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/app/app.router.dart';
import 'package:stacked_app/ui/common/app_strings.dart';
import 'package:stacked_app/ui/views/login/repository/login_repository_implement.dart';
import 'package:stacked_app/widgets/cust_button.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navigation = locator<NavigationService>();
    return Row(
      children: [
        Text(
          dontHaveAccount,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        //
        //Signup Button
        CustButton(
          text: signup,
          isTextButton: true,
          onPressed: () {
            navigation.replaceWithSignupView();
          },
        ),
      ],
    );
  }
}
