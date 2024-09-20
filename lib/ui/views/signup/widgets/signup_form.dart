import 'package:flutter/material.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_app/ui/common/app_strings.dart';
import 'package:stacked_app/ui/common/validator/text_form_validator.dart';
import 'package:stacked_app/ui/views/signup/widgets/signup_form.form.dart';
import 'package:stacked_app/widgets/primary_text_formfield.dart';

@FormView(fields: [
  FormTextField(
    name: 'fullname',
    validator: TextFormValidators.emailValidators,
  ),
  FormTextField(
    name: 'email',
    validator: TextFormValidators.emailValidators,
  ),
  FormTextField(
    name: 'Password',
    validator: TextFormValidators.passwordValidators,
  )
])
class SignupForm extends StatelessWidget with $SignupForm {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        //
        //First and last name
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              //user name
              child: PrimaryTextFormField(
                controller: fullnameController,
                validator: TextFormValidators.userNameValidators,
                hintText: firstName,
                iconData: Icons.person,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        //
        //email
        PrimaryTextFormField(
          controller: emailController,
          validator: TextFormValidators.emailValidators,
          hintText: email,
          iconData: Icons.email,
        ),
        const SizedBox(
          height: 50,
        ),
        //
        //password
        PrimaryTextFormField(
          controller: passwordController,
          validator: TextFormValidators.passwordValidators,
          hintText: password,
          iconData: Icons.email,
        ),
        const SizedBox(
          height: 20,
        ),

        const SizedBox(
          height: 40,
        ),
      ],
    ));
  }
}
