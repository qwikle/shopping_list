import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(1.h),
        child: Align(
          alignment: const Alignment(0, -1 / 3),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/svg/two_factor.svg',
                  fit: BoxFit.contain,
                  height: 20.h,
                ),
                SizedBox(
                  height: 4.h,
                ),
                const Text(
                  'Veuillez entrer votre code de vérification',
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
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
                SizedBox(
                  height: 5.h,
                ),
                ElevatedButton(onPressed: null, child: Text('Send'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
