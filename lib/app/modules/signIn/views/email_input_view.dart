import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../inputs/email_input.dart';
import '../controllers/sign_in_controller.dart';

class EmailInputView extends GetView<SignInController> {
  const EmailInputView({Key? key}) : super(key: key);

  String? _errorMessage() {
    if (controller.email.value.invalid) {
      if (controller.email.value.error == EmailValidationError.empty) {
        return 'Veuillez indiquer votre email.';
      }
      if (controller.email.value.error == EmailValidationError.notEmail) {
        return 'Veuillez indiquer une adresse email valide.';
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Obx((() => TextField(
          onChanged: controller.onEmailChanged,
          decoration: InputDecoration(
              hintText: 'Email',
              errorText: _errorMessage(),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              suffixIcon: const Icon(Icons.close)),
        )));
  }
}
