import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../components/forms/email_input_view.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Réinitilisation de votre mot de passe'),
      ),
      body: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 6.h,
              ),
              SvgPicture.asset(
                'assets/svg/forgot_password.svg',
                height: 15.h,
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: const [
                  Text('Mot de passe oublié ?',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              const Text(
                  'Veuillez saisir votre adresse email. Un code vous sera transmis pour réinitialiser votre mot de passe.'),
              SizedBox(height: 3.h),
              EmailInputView(
                  input: controller.email,
                  onChanged: controller.onEmailChanged,
                  label: 'Email'),
              SizedBox(
                height: 2.h,
              ),
              Obx(() => ElevatedButton(
                  onPressed: controller.status.value.isValid
                      ? () => controller.sendEmail()
                      : null,
                  child: const Text('Envoyer')))
            ],
          ),
        ),
      ),
    );
  }
}
