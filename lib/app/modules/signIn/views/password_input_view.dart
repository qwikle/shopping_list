import 'package:flutter/material.dart';

import 'package:formz/formz.dart';
import 'package:get/get.dart';

import '../../../inputs/password_input.dart';
import '../controllers/sign_in_controller.dart';

class PasswordInputView extends GetView<SignInController> {
  PasswordInputView({Key? key}) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();
  String? _errorMessage() {
    if (controller.password.value.invalid) {
      if (controller.password.value.error == PasswordValidationError.empty) {
        return 'Veuillez saisir le mot de passe.';
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextField(
          controller: _textEditingController
            ..text = controller.status.value == FormzStatus.submissionFailure
                ? ''
                : controller.password.value.value,
          keyboardType: TextInputType.visiblePassword,
          obscureText: controller.obscure.value,
          onChanged: controller.onPasswordChanged,
          decoration: InputDecoration(
              label: const Text('Password'),
              errorText: _errorMessage(),
              suffixIcon: InkWell(
                child: controller.obscure.value
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                onTap: () => controller.obscureText(),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              )),
        ));
  }
}
