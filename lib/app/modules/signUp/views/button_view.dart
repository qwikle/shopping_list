import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class ButtonView extends GetView<SignUpController> {
  const ButtonView({Key? key, required this.onPressed}) : super(key: key);

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedButton(
        onPressed: onPressed,
        child: controller.page.value == SignUpPage.information
            ? const Text('Suivant')
            : const Text('S\'inscrire'),
      ),
    );
  }
}
