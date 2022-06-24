import 'package:get/get.dart';

import '../../../config/config.dart';
import '../../../exceptions/code_token_exception.dart';

class CodetokenProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = apiUrl;
  }

  Future<void> checkCode(String email, String code) async {
    final response = await post('/check-token', {
      'email': email,
      'code': code,
    });
    if (response.statusCode == (400 | 422)) {
      throw CodeTokenFailureException.fromCode(response.statusCode!);
    }
  }
}
