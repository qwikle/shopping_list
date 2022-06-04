import 'package:flutter/material.dart';

import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/models/sign_up_model.dart';
import '../../../exceptions/sign_up_exception.dart';
import '../../../inputs/birth_day_input.dart';
import '../../../inputs/confirmation_input.dart';
import '../../../inputs/email_input.dart';
import '../../../inputs/name_input.dart';
import '../../../inputs/password_input.dart';
import '../../../routes/app_pages.dart';
import '../providers/sign_up_provider.dart';

class SignUpController extends GetxController {
  Rx<FormzStatus> status = FormzStatus.pure.obs;
  Rx<EmailInput> email = const EmailInput.pure().obs;
  Rx<ConfirmationInput> emailConfirmation =
      const ConfirmationInput.pure('').obs;
  Rx<PasswordInput> password = const PasswordInput.pure().obs;
  Rx<ConfirmationInput> passwordConfirmation =
      const ConfirmationInput.pure('').obs;
  Rx<NameInput> firstName = const NameInput.pure('').obs;
  Rx<NameInput> lastName = const NameInput.pure('').obs;
  Rx<DateOfBirthInput> birthDay = DateOfBirthInput.pure().obs;
  Rx<bool> obscure = false.obs;
  final SignUpProvider _signUpProvider = Get.find();
  TextEditingController passwordController = TextEditingController();
  _validateStatus() {
    status.value = Formz.validate([
      email.value,
      emailConfirmation.value,
      password.value,
      passwordConfirmation.value,
      firstName.value,
      lastName.value,
      birthDay.value,
    ]);
  }

  _formatDate() {
    final format = DateFormat('yyyy-MM-dd');
    return format.format(birthDay.value.value);
  }

  SignUp _createPayload() {
    return SignUp(
      email: email.value.value,
      emailConfirmation: emailConfirmation.value.value,
      password: password.value.value,
      passwordConfirmation: passwordConfirmation.value.value,
      firstName: firstName.value.value,
      lastName: lastName.value.value,
      birthDay: _formatDate(),
    );
  }

  onEmailChanged(String value) {
    email.value = EmailInput.dirty(value: value);
    _validateStatus();
  }

  onEmailConfirmationChanged(String value) {
    emailConfirmation.value =
        ConfirmationInput.dirty(email.value.value, value: value);
    _validateStatus();
  }

  onPasswordChanged(String value) {
    password.value = PasswordInput.dirty(value: value);
    _validateStatus();
  }

  onPasswordConfirmationChanged(String value) {
    passwordConfirmation.value =
        ConfirmationInput.dirty(password.value.value, value: value);
    _validateStatus();
  }

  onFirstNameChanged(String value) {
    firstName.value = NameInput.dirty(value: value);
    _validateStatus();
  }

  onLastNameChanged(String value) {
    lastName.value = NameInput.dirty(value: value);
    _validateStatus();
  }

  onBirthDayChanged(DateTime value) {
    birthDay.value = DateOfBirthInput.dirty(value);
    _validateStatus();
  }

  signUp() async {
    status.value = FormzStatus.submissionInProgress;
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await _signUpProvider.signUp(_createPayload());
      status.value = FormzStatus.submissionSuccess;
      Get.back();
      return Get.offNamed(Routes.SUCESS_SIGN, arguments: email.value.value);
    } on SignUpFailureException catch (e) {
      if (e.message == 'This email is already used.') {
        email.value = EmailInput.dirty(
          value: email.value.value,
          used: true,
        );
        status.value = FormzStatus.submissionFailure;
      } else {
        Get.back();
        Get.snackbar(
          'Error',
          e.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }
}
