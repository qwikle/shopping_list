import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/sign_in_controller.dart';
import 'button_view.dart';
import 'email_input_view.dart';
import 'password_input_view.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(6.h),
        child: Align(
          alignment: const Alignment(0, -1 / 3),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Shopping App',
                  style: TextStyle(fontSize: 3.h,),
                ),
                Padding(padding: EdgeInsets.all(2.h)),
                SvgPicture.asset(
                  'assets/svg/shopping.svg',
                  height: 20.h,
                  fit: BoxFit.contain,
                ),
                Padding(padding: EdgeInsets.all(3.h)),
                EmailInputView(),
                Padding(padding: EdgeInsets.all(3.h)),
                const PasswordInputView(),
                Padding(padding: EdgeInsets.all(3.h)),
                const ButtonView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
