import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sucess_sign_controller.dart';

class SucessSignView extends GetView<SucessSignController> {
  const SucessSignView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SucessSignView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SucessSignView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
