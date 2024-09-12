// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/ui/common/validator/text_form_validator.dart';

const bool _autoTextFieldValidation = true;

const String FullnameValueKey = 'fullname';
const String EmailValueKey = 'email';
const String PasswordValueKey = 'Password';

final Map<String, TextEditingController> _SignupFormTextEditingControllers = {};

final Map<String, FocusNode> _SignupFormFocusNodes = {};

final Map<String, String? Function(String?)?> _SignupFormTextValidations = {
  FullnameValueKey: TextFormValidators.emailValidators,
  EmailValueKey: TextFormValidators.emailValidators,
  PasswordValueKey: TextFormValidators.passwordValidators,
};

mixin $SignupForm {
  TextEditingController get fullnameController =>
      _getFormTextEditingController(FullnameValueKey);
  TextEditingController get emailController =>
      _getFormTextEditingController(EmailValueKey);
  TextEditingController get passwordController =>
      _getFormTextEditingController(PasswordValueKey);

  FocusNode get fullnameFocusNode => _getFormFocusNode(FullnameValueKey);
  FocusNode get emailFocusNode => _getFormFocusNode(EmailValueKey);
  FocusNode get passwordFocusNode => _getFormFocusNode(PasswordValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_SignupFormTextEditingControllers.containsKey(key)) {
      return _SignupFormTextEditingControllers[key]!;
    }

    _SignupFormTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _SignupFormTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_SignupFormFocusNodes.containsKey(key)) {
      return _SignupFormFocusNodes[key]!;
    }
    _SignupFormFocusNodes[key] = FocusNode();
    return _SignupFormFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    fullnameController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    passwordController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    fullnameController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    passwordController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          FullnameValueKey: fullnameController.text,
          EmailValueKey: emailController.text,
          PasswordValueKey: passwordController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _SignupFormTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _SignupFormFocusNodes.values) {
      focusNode.dispose();
    }

    _SignupFormTextEditingControllers.clear();
    _SignupFormFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get fullnameValue => this.formValueMap[FullnameValueKey] as String?;
  String? get emailValue => this.formValueMap[EmailValueKey] as String?;
  String? get passwordValue => this.formValueMap[PasswordValueKey] as String?;

  set fullnameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({FullnameValueKey: value}),
    );

    if (_SignupFormTextEditingControllers.containsKey(FullnameValueKey)) {
      _SignupFormTextEditingControllers[FullnameValueKey]?.text = value ?? '';
    }
  }

  set emailValue(String? value) {
    this.setData(
      this.formValueMap..addAll({EmailValueKey: value}),
    );

    if (_SignupFormTextEditingControllers.containsKey(EmailValueKey)) {
      _SignupFormTextEditingControllers[EmailValueKey]?.text = value ?? '';
    }
  }

  set passwordValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PasswordValueKey: value}),
    );

    if (_SignupFormTextEditingControllers.containsKey(PasswordValueKey)) {
      _SignupFormTextEditingControllers[PasswordValueKey]?.text = value ?? '';
    }
  }

  bool get hasFullname =>
      this.formValueMap.containsKey(FullnameValueKey) &&
      (fullnameValue?.isNotEmpty ?? false);
  bool get hasEmail =>
      this.formValueMap.containsKey(EmailValueKey) &&
      (emailValue?.isNotEmpty ?? false);
  bool get hasPassword =>
      this.formValueMap.containsKey(PasswordValueKey) &&
      (passwordValue?.isNotEmpty ?? false);

  bool get hasFullnameValidationMessage =>
      this.fieldsValidationMessages[FullnameValueKey]?.isNotEmpty ?? false;
  bool get hasEmailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey]?.isNotEmpty ?? false;
  bool get hasPasswordValidationMessage =>
      this.fieldsValidationMessages[PasswordValueKey]?.isNotEmpty ?? false;

  String? get fullnameValidationMessage =>
      this.fieldsValidationMessages[FullnameValueKey];
  String? get emailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey];
  String? get passwordValidationMessage =>
      this.fieldsValidationMessages[PasswordValueKey];
}

extension Methods on FormStateHelper {
  setFullnameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FullnameValueKey] = validationMessage;
  setEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailValueKey] = validationMessage;
  setPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PasswordValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    fullnameValue = '';
    emailValue = '';
    passwordValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      FullnameValueKey: getValidationMessage(FullnameValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
      PasswordValueKey: getValidationMessage(PasswordValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _SignupFormTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _SignupFormTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      FullnameValueKey: getValidationMessage(FullnameValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
      PasswordValueKey: getValidationMessage(PasswordValueKey),
    });
