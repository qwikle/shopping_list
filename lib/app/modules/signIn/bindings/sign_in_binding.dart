import 'package:get/get.dart';

import '../controllers/sign_in_controller.dart';
import '../providers/sign_in_provider.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(
      () => SignInController(),
    );
    Get.lazyPut<SignInProvider>(() => SignInProvider());
  }
}
