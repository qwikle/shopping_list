import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../components/forms/confirmation_input_view.dart';
import '../../../components/forms/email_input_view.dart';
import '../../../components/forms/password_input_view.dart';
import '../../../config/types.dart';
import '../controllers/sign_up_controller.dart';
import 'button_view.dart';

class InformationView extends GetView<SignUpController> {
  const InformationView({Key? key}) : super(key: key);
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
                  style: GoogleFonts.nunitoSans(
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
                EmailInputView(
                  input: controller.email,
                  label: 'Adresse mail',
                  onChanged: controller.onEmailChanged,
                ),
                SizedBox(height: 2.h),
                ConfirmationInputView(
                  input: controller.emailConfirmation,
                  onChanged: controller.onEmailConfirmationChanged,
                  label: 'Confirmez votre adresse mail',
                  type: ConfirmationType.email,
                ),
                SizedBox(height: 2.h),
                PasswordInputView(
                  input: controller.password,
                  label: 'Mot de passe',
                  controller: controller.passwordController,
                  onChanged: controller.onPasswordChanged,
                  obscure: controller.obscure,
                ),
                SizedBox(height: 2.h),
                ConfirmationInputView(
                  input: controller.passwordConfirmation,
                  onChanged: controller.onPasswordConfirmationChanged,
                  label: 'Confirmez votre mot de passe',
                  obscure: controller.obscure,
                  type: ConfirmationType.password,
                ),
                SizedBox(height: 6.h),
                ButtonView(
                  onPressed:
                      controller.informationStatus.value == FormzStatus.valid
                          ? () => controller.page.value = SignUpPage.profile
                          : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
