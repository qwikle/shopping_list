import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../app/controllers/auth_controller.dart';
import '../app_pages.dart';

class AuthMiddleware extends GetMiddleware {
  AuthMiddleware({this.priority});
  @override
  int? priority = 0;

  @override
  RouteSettings? redirect(String? route) {
    final authController = Get.find<AuthController>();
    return authController.isLoggedIn.value
        ? null
        : const RouteSettings(name: Routes.SIGN_IN);
  }
}