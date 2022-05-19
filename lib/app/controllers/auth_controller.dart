
  
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/models/token_model.dart';

class AuthController extends GetxController with CacheManager {
  final isLoggedIn = false.obs;
  final Rx<Token> token = const Token(token: '', type: '').obs;
  @override
  void onInit() {
    checkStatus();
    super.onInit();
  }

  checkStatus() {
    final localToken = getToken();
    if (localToken != null) {
      isLoggedIn.value = true;
      token.value = localToken;
    }
  }

  signIn(Token accessToken) {
    saveToken(accessToken);
    isLoggedIn.value = true;
    token.value = accessToken;
  }

  signOut() {
    removeToken();
    isLoggedIn.value = false;
  }
}

mixin CacheManager {
  bool saveToken(Token token) {
    final box = GetStorage();
    box.write(CacheManagerKey.token.toString(), token.toJson());
    return true;
  }

  Token? getToken() {
    final box = GetStorage();
    final token = box.read(CacheManagerKey.token.toString());
    if (token != null) {
      // if (checkValidity(Token.fromJson(token))) {
      //   return Token.fromJson(token);
      // }
      return Token.fromJson(token);
    }
    return null;
  }

  // bool checkValidity(Token token) {
  //   if (token.expiresAt.isBefore(DateTime.now()) ||
  //       token.expiresAt.isAtSameMomentAs(DateTime.now())) return false;
  //   return true;
  // }

  void removeToken() {
    final box = GetStorage();
    box.remove(CacheManagerKey.token.toString());
  }
}

enum CacheManagerKey { token }