import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../components/forms/confirmation_input_view.dart';
import '../../../components/forms/email_input_view.dart';
import '../../../components/forms/password_input_view.dart';
import '../../../config/config.dart';
import '../../../config/types.dart';
import '../../../routes/app_pages.dart';
import '../controllers/sign_up_controller.dart';
import 'button_view.dart';

class InformationView extends GetView<SignUpController> {
  const InformationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Informations de connection',
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
          type: PasswordType.createPassword,
        ),
        SizedBox(height: 2.h),
        ConfirmationInputView(
          input: controller.passwordConfirmation,
          onChanged: controller.onPasswordConfirmationChanged,
          label: 'Confirmez votre mot de passe',
          type: ConfirmationType.password,
        ),
        SizedBox(height: 6.h),
        ButtonView(
          status: controller.status,
          onPressed: () => controller.next(),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Déjà un compte ? '),
            TextButton(
              onPressed: () => Get.offNamed(Routes.SIGN_IN),
              child: const Text('Se connecter'),
              style: TextButton.styleFrom(
                primary: primaryColor,
              ),
            )
          ],
        )
      ],
    );
  }
}
