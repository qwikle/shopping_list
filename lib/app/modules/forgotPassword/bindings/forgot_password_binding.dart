import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';
import '../providers/forgot_password_provider.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(
      () => ForgotPasswordController(),
    );

    Get.lazyPut<ForgotPasswordProvider>(
      () => ForgotPasswordProvider(),
    );
  }
}
