import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';

import '../../inputs/code_input.dart';

class CodeInputView extends StatelessWidget {
  CodeInputView(
      {Key? key,
      required this.input,
      required this.onChanged,
      required this.status})
      : super(key: key) {
    controller.text = input.value.value;
    controller.addListener(() {
      if (controller.text.length == 1) {
        onChanged(controller.text);
        status.value.isInvalid ? focusNode.nextFocus() : focusNode.unfocus();
      }
    });
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        controller.clear();
        input.value = const CodeInput.dirty(value: '');
      }
    });
  }
  final Rx<FormzStatus> status;
  final Rx<CodeInput> input;
  final void Function(String) onChanged;
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  String? _errorMessage() {
    if (input.value.invalid) {
      if (input.value.error == CodeValidationError.empty) {
        return null;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (status.value.isSubmissionFailure) {
        controller.clear();
        input.value = const CodeInput.dirty(value: '');
      }
      return SizedBox(
        height: 48,
        width: 48,
        child: TextFormField(
          focusNode: focusNode,
          decoration: InputDecoration(
            errorText: _errorMessage(),
          ),
          controller: controller,
          textCapitalization: TextCapitalization.sentences,
          onChanged: onChanged,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.deny(
                RegExp(r'[?!@#$%^&*\(\)\[\]\{\}\\|<>/\+=_\-~`]')),
          ],
        ),
      );
    });
  }
}
