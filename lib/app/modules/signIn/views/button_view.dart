import 'package:flutter/material.dart';

import 'package:formz/formz.dart';
import 'package:get/get.dart';

import '../controllers/sign_in_controller.dart';

class ButtonView extends GetView<SignInController> {
  const ButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ElevatedButton(
        onPressed:
            controller.status.value.isValid ? () => controller.signIn() : null,
        child: const Text('Se connecter'),
      );
    });
  }
}
