import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../config/config.dart';
import '../controllers/sign_in_controller.dart';
import 'email_input_view.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          EmailInputView(),
        ],
      ),
    );
  }
}
