import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PasswordInputView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PasswordInputView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PasswordInputView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
