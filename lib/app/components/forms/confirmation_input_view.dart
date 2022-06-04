import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config/types.dart';
import '../../inputs/confirmation_input.dart';
import '../widgets/clear_suffix_icon.dart';
import '../widgets/obscure_text_icon.dart';

class ConfirmationInputView extends StatelessWidget {
  ConfirmationInputView({
    Key? key,
    required this.input,
    required this.onChanged,
    required this.label,
    this.type = ConfirmationType.text,
    this.obscure,
  }) : super(key: key) {
    controller.text = input.value.value;
  }
  final Rx<ConfirmationInput> input;
  final TextEditingController controller = TextEditingController();
  final ConfirmationType type;
  final String label;
  final Rx<bool>? obscure;
  final void Function(String) onChanged;

  _onTap() {
    input.value = const ConfirmationInput.dirty('', value: '');
    controller.clear();
  }

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

  TextInputType _keyboardType() {
    switch (type) {
      case ConfirmationType.email:
        return TextInputType.emailAddress;
      case ConfirmationType.password:
        return TextInputType.visiblePassword;
      case ConfirmationType.number:
        return TextInputType.number;
      case ConfirmationType.date:
        return TextInputType.datetime;
      default:
        return TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        controller: controller,
        keyboardType: _keyboardType(),
        onChanged: onChanged,
        decoration: InputDecoration(
          label: Text(label),
          errorText: _errorMessage(),
          suffixIcon: type == ConfirmationType.password
              ? ObscureText(
                  obscure: obscure!,
                )
              : ClearSuffixIcon(
                  onTap: _onTap,
                ),
        ),
      ),
    );
  }
}
