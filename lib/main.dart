import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'app/config/config.dart';
import 'app/controllers/auth_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  Get.put(AuthController());
  runApp(
    Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: "Application",
        theme: theme,
        themeMode: ThemeMode.system,
        defaultTransition: Transition.fadeIn,
        darkTheme: darkTheme,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
      );
    }),
  );
}
