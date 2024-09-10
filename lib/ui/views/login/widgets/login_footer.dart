import 'package:flutter/material.dart';
import 'package:stacked_app/ui/common/app_strings.dart';
import 'package:stacked_app/widgets/cust_button.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const SignupView()),
            // );
          },
        ),
      ],
    );
  }
}
