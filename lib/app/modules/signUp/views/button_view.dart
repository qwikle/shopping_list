import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class ButtonView extends GetView<SignUpController> {
  const ButtonView({Key? key, required this.onPressed, required this.status}) : super(key: key);

  final Rx<FormzStatus> status;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedButton(
        onPressed: status.value.isValid ? onPressed : null,
        child: controller.page.value == SignUpPage.information
            ? const Text('Suivant')
            : const Text('S\'inscrire'),
      ),
    );
  }
}
