import 'package:get/utils.dart';
import 'package:intl/intl.dart';

enum PasswordType {
  createPassword,
  existPassword,
}

enum ConfirmationType {
  password,
  text,
  email,
  number,
  date,
}

enum DateType {
  birthDay,
  range,
}

class Utils {
  static String formatDate(DateTime date) {
    final format = DateFormat('dd/MM/yyyy');
    return format.format(date);
  }

  static isFrenchDate(String value) =>
      GetUtils.hasMatch(value, r'^[0-9]{2}/[0-9]{2}/[0-9]{4}$');
}
