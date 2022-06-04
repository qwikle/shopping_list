import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config/types.dart';
import '../../inputs/password_input.dart';
import '../widgets/obscure_text_icon.dart';

class PasswordInputView extends StatelessWidget {
  PasswordInputView({
    Key? key,
    this.type = PasswordType.existPassword,
    required this.input,
    required this.obscure,
    required this.onChanged,
    required this.controller,
    required this.label,
  }) : super(key: key) {
    controller.text = input.value.value;
  }

  /// Declare the type of the password input.
  /// If the type is [PasswordType.createPassword], the error message will pop if fail in regex.
  final PasswordType type;
  final Rx<PasswordInput> input;
  final Rx<bool> obscure;
  final String label;
  final TextEditingController controller;
  final void Function(String) onChanged;

  String? _errorMessage() {
    if (input.value.invalid) {
      if (input.value.error == PasswordValidationError.empty) {
        return 'Veuillez saisir le mot de passe.';
      }
    }
    if (type == PasswordType.createPassword &&
        input.value.error == PasswordValidationError.regex) {
      return 'le password doit contenir au moins 8 caractères dont au moins une majuscule, une minuscule et un chiffre.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        controller: controller,
        keyboardType: TextInputType.visiblePassword,
        obscureText: obscure.value,
        onChanged: onChanged,
        decoration: InputDecoration(
          label: Text(label),
          errorText: _errorMessage(),
          suffixIcon: ObscureText(
            obscure: obscure,
          ),
        ),
      ),
    );
  }
}
