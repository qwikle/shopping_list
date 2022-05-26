import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/config/config.dart';
import 'app/controllers/auth_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  Get.put(AuthController());
  runApp(
    GetMaterialApp(
      title: "Application",
      theme: theme,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
