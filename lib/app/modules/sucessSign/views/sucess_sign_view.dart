import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sucess_sign_controller.dart';

class SucessSignView extends GetView<SucessSignController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SucessSignView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SucessSignView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
