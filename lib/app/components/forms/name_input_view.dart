import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../inputs/name_input.dart';
import '../widgets/clear_suffix_icon.dart';

class NameInputView extends StatelessWidget {
  const NameInputView({
    Key? key,
    required this.controller,
    required this.label,
    required this.input,
    required this.onChanged,
    required this.onTap,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final Rx<NameInput> input;
  final void Function(String) onChanged;
  final void Function()? onTap;

  _errorMessage() {
    if (input.value.invalid) {
      if (input.value.error == NameValidationError.empty) {
        return 'Veuillez indiquer votre $label.';
      } else if (input.value.error == NameValidationError.tooShort) {
        return 'Votre $label doit contenir au moins 3 caractères.';
      } else if (input.value.error == NameValidationError.tooLong) {
        return 'Votre $label ne doit pas dépasser 50 caractères.';
      } else if (input.value.error == NameValidationError.invalid) {
        return 'Votre $label ne doit contenir que des lettres.';
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: label,
            errorText: _errorMessage(),
            suffixIcon: ClearSuffixIcon(
              onTap: onTap,
            ),
          ),
        ));
  }
}
