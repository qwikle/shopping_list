import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_list/app/components/forms/code_input.view.dart';
import 'package:sizer/sizer.dart';

import '../controllers/code_token_controller.dart';

class CodeTokenView extends GetView<CodeTokenController> {
  const CodeTokenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Code Verification'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CodeInputView(
                  status: controller.status,
                  input: controller.codeOne,
                  onChanged: controller.onCodeOneChanged,
                ),
                CodeInputView(
                  status: controller.status,
                  input: controller.codeTwo,
                  onChanged: controller.onCodeTwoChanged,
                ),
                CodeInputView(
                  status: controller.status,
                  input: controller.codeThree,
                  onChanged: controller.onCodeThreeChanged,
                ),
                CodeInputView(
                  status: controller.status,
                  input: controller.codeFour,
                  onChanged: controller.onCodeFourChanged,
                ),
                CodeInputView(
                  status: controller.status,
                  input: controller.codeFive,
                  onChanged: controller.onCodeFiveChanged,
                ),
                CodeInputView(
                  status: controller.status,
                  input: controller.codeSix,
                  onChanged: controller.onCodeSixChanged,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
