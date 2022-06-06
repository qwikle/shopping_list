import 'package:get/get.dart';
import 'package:shopping_list/app/modules/forgotPassword/providers/forgot_password_provider.dart';

import '../controllers/forgot_password_controller.dart';

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
