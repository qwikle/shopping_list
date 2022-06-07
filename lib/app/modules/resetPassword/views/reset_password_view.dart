import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 48,
                  width: 44,
                  child: TextFormField(
                    onChanged: (value){
                      if(value.length ==1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(hintText: "0"),
                  ),
                ),
                SizedBox(
                  height: 48,
                  width: 44,
                  child: TextFormField(
                    onChanged: (value){
                      if(value.length ==1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(hintText: "0"),
                  ),
                ),
                SizedBox(
                  height: 48,
                  width: 44,
                  child: TextFormField(
                    onChanged: (value){
                      if(value.length ==1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(hintText: "0"),
                  ),
                ),
                SizedBox(
                  height: 48,
                  width: 44,
                  child: TextFormField(
                    onChanged: (value){
                      if(value.length ==1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(hintText: "0"),
                  ),
                ),
                SizedBox(
                  height: 48,
                  width: 44,
                  child: TextFormField(
                    onChanged: (value){
                      if(value.length ==1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(hintText: "0"),
                  ),
                ),
                SizedBox(
                  height: 48,
                  width: 44,
                  child: TextFormField(
                    onChanged: (value){
                      if(value.length ==1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(hintText: "0"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
