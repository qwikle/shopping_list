import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../components/forms/date_input_view.dart';
import '../../../components/forms/name_input_view.dart';
import '../../../config/config.dart';
import '../../../routes/app_pages.dart';
import '../controllers/sign_up_controller.dart';
import 'button_view.dart';

class ProfileView extends GetView<SignUpController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Informations personnelles',
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
        NameInputView(
          label: 'Prénom',
          input: controller.firstName,
          onChanged: controller.onFirstNameChanged,
        ),
        SizedBox(height: 2.h),
        NameInputView(
          label: 'Nom',
          input: controller.lastName,
          onChanged: controller.onLastNameChanged,
        ),
        SizedBox(height: 2.h),
        DateInputView(
          input: controller.birthDay,
          label: 'Date de naissance',
          onChanged: controller.onBirthDayChanged,
        ),
        SizedBox(height: 2.h),
        ButtonView(
          status: controller.status,
          onPressed: controller.signUp,
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
