import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../inputs/email_input.dart';
import '../widgets/clear_suffix_icon.dart';

class EmailInputView extends StatelessWidget {
  const EmailInputView({
    Key? key,
    required this.input,
    required this.controller,
    required this.onChanged,
    required this.onTap,
    required this.label,
  }) : super(key: key);

  final Rx<EmailInput> input;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final void Function()? onTap;
  final String label;
  String? _errorMessage() {
    if (input.value.invalid) {
      if (input.value.error == EmailValidationError.empty) {
        return 'Veuillez indiquer votre email.';
      }
      if (input.value.error == EmailValidationError.notEmail) {
        return "L'adresse email n'est pas valide.";
      }
    }
    if (input.value.error == EmailValidationError.used) {
      return 'Cette adresse email est déjà utilisée.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        onChanged: onChanged,
        decoration: InputDecoration(
          label: Text(label),
          errorText: _errorMessage(),
          suffixIcon: ClearSuffixIcon(
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
