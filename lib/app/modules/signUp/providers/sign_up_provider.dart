import 'package:get/get.dart';

import '../../../config/config.dart';

class SignUpProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = apiUrl;
  }
}
