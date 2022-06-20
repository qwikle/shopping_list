import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:shopping_list/app/inputs/code_input.dart';

class CodeTokenController extends GetxController {
  final Rx<FormzStatus> status = FormzStatus.pure.obs;
  final Rx<CodeInput> codeOne = const CodeInput.pure().obs;
  final Rx<CodeInput> codeTwo = const CodeInput.pure().obs;
  final Rx<CodeInput> codeThree = const CodeInput.pure().obs;
  final Rx<CodeInput> codeFour = const CodeInput.pure().obs;
  final Rx<CodeInput> codeFive = const CodeInput.pure().obs;
  final Rx<CodeInput> codeSix = const CodeInput.pure().obs;

  _validateStatus() {
    status.value = Formz.validate([
      codeOne.value,
      codeTwo.value,
      codeThree.value,
      codeFour.value,
      codeFive.value,
      codeSix.value,
    ]);
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
}
