import 'dart:io';

import 'package:flutter/material.dart';

import 'package:formz/formz.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../exceptions/sign_in_exception.dart';
import '../../../inputs/email_input.dart';
import '../../../inputs/password_input.dart';
import '../../../routes/app_pages.dart';
import '../providers/sign_in_provider.dart';

class SignInController extends GetxController {
  Rx<FormzStatus> status = FormzStatus.pure.obs;
  Rx<EmailInput> email = const EmailInput.pure().obs;
  Rx<PasswordInput> password = const PasswordInput.pure().obs;
  Rx<bool> obscure = true.obs;

  SignInProvider signProvider = Get.find<SignInProvider>();
  AuthController authController = Get.find<AuthController>();
  TextEditingController passwordEditingController = TextEditingController();

  _validateStatus() {
    status.value = Formz.validate([email.value, password.value]);
  }

  onEmailChanged(String emailValue) {
    email.value = EmailInput.dirty(value: emailValue);
    _validateStatus();
  }

  void _clearPassword() {
    password.value = const PasswordInput.pure();
    passwordEditingController.clear();
  }

  onPasswordChanged(String passwordValue) {
    password.value = PasswordInput.dirty(value: passwordValue);
    _validateStatus();
  }

  _signInFailure(e) {
    Get.back();
    _clearPassword();
    Get.closeAllSnackbars();
    Get.snackbar('Erreur', e.message, snackPosition: SnackPosition.BOTTOM);
  }

  signIn() async {
    status.value = FormzStatus.submissionInProgress;
    Get.dialog(const Center(
      child: CircularProgressIndicator(),
    ));
    try {
      final token =
          await signProvider.signIn(email.value.value, password.value.value);
      await authController.signIn(token);
      status.value = FormzStatus.submissionSuccess;
      Get.back();
      Get.offNamed(Routes.HOME);
    } on SignInFailureException catch (e) {
      _signInFailure(e);
    } on SocketException catch (e) {
      _signInFailure(e);
    }
  }
}
