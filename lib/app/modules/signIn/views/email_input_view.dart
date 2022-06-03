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
          controller: controller.emailEditingController,
          keyboardType: TextInputType.emailAddress,
          onChanged: controller.onEmailChanged,
          decoration: InputDecoration(
              label: const Text('Email'),
              errorText: _errorMessage(),
              suffixIcon: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: const Icon(Icons.cancel_outlined),
                onTap: () {
                  controller.emailEditingController.clear();
                  controller.clearEmail();
                },
              )),
        )));
  }
}
