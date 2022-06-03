import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config/types.dart';
import '../../inputs/confirmation_input.dart';
import '../widgets/clear_suffix_icon.dart';
import '../widgets/obscure_text_icon.dart';

class ConfirmationInputView extends StatelessWidget {
  const ConfirmationInputView({
    Key? key,
    required this.input,
    required this.controller,
    required this.onChanged,
    required this.onTap,
    required this.label,
    this.type = ConfirmationType.text,
    this.obscure,
  }) : super(key: key);
  final Rx<ConfirmationInput> input;
  final TextEditingController controller;
  final ConfirmationType type;
  final String label;
  final Rx<bool>? obscure;
  final void Function(String) onChanged;
  final void Function()? onTap;

  _errorMessage() {
    if (input.value.invalid) {
      if (input.value.error == ConfirmationValidationError.empty) {
        return 'La confirmation de ce champs est requise.';
      }
      if (input.value.error == ConfirmationValidationError.misMatch) {
        return 'Les deux champs ne sont pas identiques.';
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          label: Text(label),
          errorText: _errorMessage(),
          suffixIcon: type == ConfirmationType.password
              ? ObscureText(
                  obscure: obscure!,
                  onTap: onTap,
                )
              : ClearSuffixIcon(
                  onTap: onTap,
                ),
        ),
      ),
    );
  }
}
