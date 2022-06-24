import 'package:get/get.dart';

import '../../../config/config.dart';
import '../../../exceptions/forgot_password_exception.dart';

class ForgotPasswordProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = apiUrl;
  }

  Future<void> forgotPassword(String email) async {
    final response = await post('/forgot-password', {'email': email});

    if (response.statusCode != 201 && response.statusCode != null) {
      throw ForgotPasswordFailureException.fromCode(response.statusCode!);
    }
  }
}
