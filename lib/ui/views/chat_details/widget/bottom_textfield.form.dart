// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String ChatBoxValueKey = 'chatBox';

final Map<String, TextEditingController>
    _BottomTextfieldTextEditingControllers = {};

final Map<String, FocusNode> _BottomTextfieldFocusNodes = {};

final Map<String, String? Function(String?)?> _BottomTextfieldTextValidations =
    {
  ChatBoxValueKey: null,
};

mixin $BottomTextfield {
  TextEditingController get chatBoxController =>
      _getFormTextEditingController(ChatBoxValueKey);

  FocusNode get chatBoxFocusNode => _getFormFocusNode(ChatBoxValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_BottomTextfieldTextEditingControllers.containsKey(key)) {
      return _BottomTextfieldTextEditingControllers[key]!;
    }

    _BottomTextfieldTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _BottomTextfieldTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_BottomTextfieldFocusNodes.containsKey(key)) {
      return _BottomTextfieldFocusNodes[key]!;
    }
    _BottomTextfieldFocusNodes[key] = FocusNode();
    return _BottomTextfieldFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    chatBoxController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    chatBoxController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          ChatBoxValueKey: chatBoxController.text,
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

    for (var controller in _BottomTextfieldTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _BottomTextfieldFocusNodes.values) {
      focusNode.dispose();
    }

    _BottomTextfieldTextEditingControllers.clear();
    _BottomTextfieldFocusNodes.clear();
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

  String? get chatBoxValue => this.formValueMap[ChatBoxValueKey] as String?;

  set chatBoxValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ChatBoxValueKey: value}),
    );

    if (_BottomTextfieldTextEditingControllers.containsKey(ChatBoxValueKey)) {
      _BottomTextfieldTextEditingControllers[ChatBoxValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasChatBox =>
      this.formValueMap.containsKey(ChatBoxValueKey) &&
      (chatBoxValue?.isNotEmpty ?? false);

  bool get hasChatBoxValidationMessage =>
      this.fieldsValidationMessages[ChatBoxValueKey]?.isNotEmpty ?? false;

  String? get chatBoxValidationMessage =>
      this.fieldsValidationMessages[ChatBoxValueKey];
}

extension Methods on FormStateHelper {
  setChatBoxValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ChatBoxValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    chatBoxValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      ChatBoxValueKey: getValidationMessage(ChatBoxValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _BottomTextfieldTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _BottomTextfieldTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      ChatBoxValueKey: getValidationMessage(ChatBoxValueKey),
    });
