import 'dart:io';

import 'package:get/get.dart';

import '../../../config/config.dart';
import '../../../data/models/token_model.dart';
import '../../../exceptions/sign_in_exception.dart';

class SignInProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = apiUrl;
  }

  Future<Token> signIn(String email, String password) async {
    try {
      final payload = {'email': email, 'password': password};

      final response = await post('/login', payload);

      if (response.statusCode == 200) {
        return Token.fromJson(response.body);
      }
      if (response.statusCode == 400) {
        throw SignInFailureException.fromCode(response.statusCode!);
      }
    } catch (e) {
      throw const SocketException('Failed to connect to the server');
    }

      throw const SocketException('Failed to connect to the server');
  }
}