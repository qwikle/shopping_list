import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final Rx<String> email = ''.obs;
  final Rx<String> code = ''.obs;

  @override
  void onInit() {
    super.onInit();
    email.value = Get.arguments['email'];
    code.value = Get.arguments['code'];
  }
}
