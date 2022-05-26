import 'package:get/get.dart';
import 'package:shopping_list/app/data/models/token_model.dart';
import 'package:shopping_list/app/exceptions/sign_in_exception.dart';

import '../../../config/config.dart';

class SignInProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = apiUrl;
  }

  Future<Token> signIn(String email, String password) async {
    final payload = {'email': email, 'password': password};

    final response = await post('/login', payload);

    if (response.statusCode == 200) {
      return Token.fromJson(response.body);
    }
    throw SignInFailureException.fromCode(response.statusCode!);
  }
}
