import 'package:flutter/material.dart';

import 'package:formz/formz.dart';
import 'package:get/get.dart';

import '../../../exceptions/forgot_password_exception.dart';
import '../../../inputs/email_input.dart';
import '../providers/forgot_password_provider.dart';

class ForgotPasswordController extends GetxController {
  Rx<EmailInput> email = const EmailInput.pure().obs;
  Rx<FormzStatus> status = FormzStatus.pure.obs;
  final ForgotPasswordProvider _forgotPasswordProvider =
      Get.find<ForgotPasswordProvider>();

  onEmailChanged(String value) {
    email.value = EmailInput.dirty(value: value);
    status.value = Formz.validate([email.value]);
  }

  sendEmail() async {
    status.value = FormzStatus.submissionInProgress;
    Get.dialog(const Center(
      child: CircularProgressIndicator(),
    ));
    try {
      await _forgotPasswordProvider.forgotPassword(email.value.value);
      status.value = FormzStatus.submissionSuccess;
    } on ForgotPasswordFailureException catch (e) {
      Get.back();
      Get.closeAllSnackbars();
      Get.snackbar('Erreur', e.message, snackPosition: SnackPosition.BOTTOM);
      status.value = FormzStatus.submissionFailure;
    }
  }
}
