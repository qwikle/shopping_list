import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../signUp/views/button_view.dart';
import '../controllers/sign_up_controller.dart';

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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to\nMy Shopping List Apps',
                    style: TextStyle(
                      fontSize: 3.h,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  SvgPicture.asset(
                    'assets/svg/sign-up-mail.svg',
                    height: 20.h,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 3.h),
                  const ButtonView()
                ],
              ),
            ),
          ),
        ));
  }
}
