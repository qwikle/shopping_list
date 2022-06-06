import 'package:flutter/material.dart';

import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shopping_list/app/config/types.dart';

import '../../../data/models/sign_up_model.dart';
import '../../../exceptions/sign_up_exception.dart';
import '../../../inputs/date_input.dart';
import '../../../inputs/confirmation_input.dart';
import '../../../inputs/email_input.dart';
import '../../../inputs/name_input.dart';
import '../../../inputs/password_input.dart';
import '../../../routes/app_pages.dart';
import '../providers/sign_up_provider.dart';

class SignUpController extends GetxController {
  final Rx<FormzStatus> status = FormzStatus.pure.obs;
  final Rx<EmailInput> email = const EmailInput.pure().obs;
  final Rx<ConfirmationInput> emailConfirmation =
      const ConfirmationInput.pure('').obs;
  final Rx<PasswordInput> password = const PasswordInput.pure().obs;
  final Rx<ConfirmationInput> passwordConfirmation =
      const ConfirmationInput.pure('').obs;
  final Rx<NameInput> firstName = const NameInput.pure('').obs;
  final Rx<NameInput> lastName = const NameInput.pure('').obs;
  final Rx<DateInput> birthDay = DateInput.pure().obs;
  final Rx<SignUpPage> page = SignUpPage.profile.obs;
  final SignUpProvider _signUpProvider = Get.find();
  final TextEditingController passwordController = TextEditingController();

  _validateInformationStatus() {
    status.value = Formz.validate([
      email.value,
      emailConfirmation.value,
      password.value,
      passwordConfirmation.value,
    ]);
  }

  _validateProfileStatus() {
    status.value = Formz.validate([
      firstName.value,
      lastName.value,
      birthDay.value,
    ]);
  }

  next() {
    page.value = SignUpPage.profile;
  }

  SignUp _createPayload() {
    return SignUp(
      email: email.value.value,
      emailConfirmation: emailConfirmation.value.value,
      password: password.value.value,
      passwordConfirmation: passwordConfirmation.value.value,
      firstName: firstName.value.value,
      lastName: lastName.value.value,
      birthDay: birthDay.value.value,
    );
  }

  onEmailChanged(String value) {
    email.value = EmailInput.dirty(value: value);
    _validateInformationStatus();
  }

  onEmailConfirmationChanged(String value) {
    emailConfirmation.value =
        ConfirmationInput.dirty(email.value.value, value: value);
    _validateInformationStatus();
  }

  onPasswordChanged(String value) {
    password.value = PasswordInput.dirty(value: value);
    _validateInformationStatus();
  }

  onPasswordConfirmationChanged(String value) {
    passwordConfirmation.value =
        ConfirmationInput.dirty(password.value.value, value: value);
    _validateInformationStatus();
  }

  onFirstNameChanged(String value) {
    firstName.value = NameInput.dirty(value: value);
    _validateProfileStatus();
  }

  onLastNameChanged(String value) {
    lastName.value = NameInput.dirty(value: value);
    _validateProfileStatus();
  }

  onBirthDayChanged(String value) {
    birthDay.value = DateInput.dirty(value: value);
    _validateProfileStatus();
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

enum SignUpPage { information, profile }
