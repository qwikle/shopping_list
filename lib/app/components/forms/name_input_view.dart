import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../inputs/name_input.dart';
import '../widgets/clear_suffix_icon.dart';

class NameInputView extends StatelessWidget {
  NameInputView({
    Key? key,
    required this.label,
    required this.input,
    required this.onChanged,
  }) : super(key: key) {
    controller.text = input.value.value;
  }

  final TextEditingController controller = TextEditingController();
  final String label;
  final Rx<NameInput> input;
  final void Function(String) onChanged;

  _onTap() {
    input.value = const NameInput.dirty(value: '');
    controller.clear();
  }

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
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            labelText: label,
            errorText: _errorMessage(),
            suffixIcon: ClearSuffixIcon(
              onTap: _onTap,
            ),
          ),
        ));
  }
}
