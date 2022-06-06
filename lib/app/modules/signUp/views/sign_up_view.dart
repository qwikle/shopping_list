import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/sign_up_controller.dart';
import 'information_view.dart';
import 'profile_view.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: const Alignment(0, -1 / 3),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Obx(
              () => controller.page.value == SignUpPage.information
                  ? const InformationView()
                  : const ProfileView(),
            ),
          ),
        ),
      ),
    );
  }
}
