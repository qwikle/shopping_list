import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_list/app/modules/signIn/views/button_view.dart';
import 'package:shopping_list/app/modules/signIn/views/password_input_view.dart';
import 'package:sizer/sizer.dart';
import '../controllers/sign_in_controller.dart';
import 'email_input_view.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Align(
          alignment: const Alignment(0, -1 / 6),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                EmailInputView(),
                Padding(padding: EdgeInsets.all(1.h)),
                const PasswordInputView(),
                ButtonView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
