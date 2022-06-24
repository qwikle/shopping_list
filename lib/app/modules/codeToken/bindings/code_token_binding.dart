import 'package:get/get.dart';

import '../controllers/code_token_controller.dart';
import '../providers/codetoken_provider.dart';

class CodeTokenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeTokenController>(
      () => CodeTokenController(),
    );
    Get.lazyPut<CodetokenProvider>(
      () => CodetokenProvider(),
    );
  }
}
