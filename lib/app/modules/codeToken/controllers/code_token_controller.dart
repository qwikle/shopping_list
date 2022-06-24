import 'package:formz/formz.dart';
import 'package:get/get.dart';

import '../../../inputs/code_input.dart';
import '../../../routes/app_pages.dart';
import '../providers/codetoken_provider.dart';

class CodeTokenController extends GetxController {
  final Rx<FormzStatus> status = FormzStatus.pure.obs;
  final Rx<CodeInput> codeOne = const CodeInput.pure().obs;
  final Rx<CodeInput> codeTwo = const CodeInput.pure().obs;
  final Rx<CodeInput> codeThree = const CodeInput.pure().obs;
  final Rx<CodeInput> codeFour = const CodeInput.pure().obs;
  final Rx<CodeInput> codeFive = const CodeInput.pure().obs;
  final Rx<CodeInput> codeSix = const CodeInput.pure().obs;
  final Rx<String> email = ''.obs;
  final Rx<String> type = ''.obs;
  _validateStatus() async {
    status.value = Formz.validate([
      codeOne.value,
      codeTwo.value,
      codeThree.value,
      codeFour.value,
      codeFive.value,
      codeSix.value,
    ]);

    if (status.value == FormzStatus.valid) {
      await checCode();
    }
  }

  _getCode() {
    return '${codeOne.value.value}${codeTwo.value.value}${codeThree.value.value}${codeFour.value.value}${codeFive.value.value}${codeSix.value.value}';
  }

  onCodeOneChanged(String value) {
    codeOne.value = CodeInput.dirty(value: value);
    _validateStatus();
  }

  onCodeTwoChanged(String value) {
    codeTwo.value = CodeInput.dirty(value: value);
    _validateStatus();
  }

  onCodeThreeChanged(String value) {
    codeThree.value = CodeInput.dirty(value: value);
    _validateStatus();
  }

  onCodeFourChanged(String value) {
    codeFour.value = CodeInput.dirty(value: value);
    _validateStatus();
  }

  onCodeFiveChanged(String value) {
    codeFive.value = CodeInput.dirty(value: value);
    _validateStatus();
  }

  onCodeSixChanged(String value) {
    codeSix.value = CodeInput.dirty(value: value);
    _validateStatus();
  }

  checCode() async {
    status.value = FormzStatus.submissionInProgress;
    try {
      await Get.find<CodetokenProvider>().checkCode(email.value, _getCode());
      if (type.value == 'check_email') {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.RESET_PASSWORD, arguments: {
          'email': email.value,
          'code': _getCode(),
        });
      }
    } catch (e) {
      status.value = FormzStatus.submissionFailure;
      Get.closeAllSnackbars();
      Get.snackbar('Erreur', e.toString());
    }
  }
}
