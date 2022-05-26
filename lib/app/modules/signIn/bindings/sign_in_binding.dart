import 'package:get/get.dart';
import 'package:shopping_list/app/modules/signIn/providers/sign_in_provider.dart';

import '../controllers/sign_in_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(
      () => SignInController(),
    );
    Get.lazyPut<SignInProvider>(() => SignInProvider());
  }
}
