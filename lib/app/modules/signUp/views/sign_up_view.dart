import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';
import 'information_view.dart';
import 'profile_view.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.page.value == SignUpPage.information
          ? const InformationView()
          : const ProfileView(),
    );
  }
}
