import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:shopping_list/app/inputs/date_input.dart';

import '../widgets/clear_suffix_icon.dart';

class DateInputView extends StatelessWidget {
  DateInputView({
    Key? key,
    required this.input,
    required this.label,
    required this.onChanged,
  }) : super(key: key) {
    controller.text = input.value.value;
  }

  _errorMessage() {
    if (input.value.invalid) {
      if (input.value.error == DateValidationError.empty) {
        return 'Veuillez indiquer votre $label.';
      }
      if (input.value.error == DateValidationError.invalid) {
        return 'Veuillez indiquer une date valide.';
      }
      if (input.value.error == DateValidationError.outOfRange) {
        return 'Veuillez indiquer une date valide.';
      }
      if (input.value.error == DateValidationError.youngerThan18) {
        return 'Vous devez avoir au moins 18 ans pour vous inscrire.';
      }
      if (input.value.error == DateValidationError.olderThan100) {
        return 'Vous devez avoir moins de 100 ans pour vous inscrire.';
      }
    }
    return null;
  }

  final Rx<DateInput> input;
  final TextEditingController controller = TextEditingController();
  final void Function(String) onChanged;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        controller: controller,
        keyboardType: TextInputType.datetime,
        onChanged: onChanged,
        maxLength: 10,
        decoration: InputDecoration(
          labelText: label,
          counterText: '',
          hintText: 'jj/mm/aaaa',
          errorText: _errorMessage(),
          suffixIcon: ClearSuffixIcon(
            onTap: () {
              input.value = DateInput.dirty(value: '');
              controller.clear();
            },
          ),
        ),
      ),
    );
  }
}
