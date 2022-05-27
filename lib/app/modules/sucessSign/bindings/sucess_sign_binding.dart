import 'package:get/get.dart';

import '../controllers/sucess_sign_controller.dart';

class SucessSignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SucessSignController>(
      () => SucessSignController(),
    );
  }
}
