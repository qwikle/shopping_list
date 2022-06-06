import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../components/forms/email_input_view.dart';
import '../../../components/forms/password_input_view.dart';
import '../../../config/config.dart';
import '../../../routes/app_pages.dart';
import '../controllers/sign_in_controller.dart';
import 'button_view.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
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
                  'Shopping App',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 3.h,
                  ),
                ),
                SizedBox(height: 10.h),
                SvgPicture.asset(
                  'assets/svg/shopping.svg',
                  height: 20.h,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 3.h),
                EmailInputView(
                  input: controller.email,
                  label: 'Adresse mail',
                  onChanged: controller.onEmailChanged,
                ),
                SizedBox(height: 5.h),
                PasswordInputView(
                  input: controller.password,
                  label: 'Mot de passe',
                  controller: controller.passwordEditingController,
                  onChanged: controller.onPasswordChanged,
                ),
                SizedBox(height: 6.h),
                const ButtonView(),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Pas encore de compte ? "),
                    TextButton(
                      onPressed: () => Get.offNamed(Routes.SIGN_UP),
                      child: const Text("S'inscrire"),
                      style: TextButton.styleFrom(
                        primary: primaryColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
