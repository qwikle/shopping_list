import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';
import '../providers/sign_up_provider.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
      () => SignUpController(),
    );

    Get.lazyPut<SignUpProvider>(() => SignUpProvider());
  }
}
