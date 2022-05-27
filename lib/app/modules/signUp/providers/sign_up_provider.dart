import 'package:get/get.dart';

import '../../../config/config.dart';
import '../../../data/models/unprocessable.model.dart';
import '../../../data/sign_up_model.dart';
import '../../../exceptions/sign_up_exception.dart';

class SignUpProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = apiUrl;
  }

  Future<Map<String, dynamic>> signUp(SignUp signUp) async {
    final response = await post('/register', signUp.toJson());

    if (response.statusCode == 201) return response.body;
    if (response.statusCode == 422) {
      final errors = response.body['errors'] as List;
      final List<Unprocessable> result = [];
      for (var element in errors) {
        result.add(Unprocessable.fromJson(element));
      }
      throw SignUpFailureException.fromCode(result);
    }
    throw const SignUpFailureException();
  }
}
