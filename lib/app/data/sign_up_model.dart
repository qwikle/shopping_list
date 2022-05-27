import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUp extends Equatable {
  final String email;
  final String emailConfirmation;
  final String password;
  final String passwordConfirmation;
  final String firstName;
  final String lastName;
  final DateTime birthDay;
  final String? avatar;

  const SignUp(
      {required this.email,
      required this.emailConfirmation,
      required this.password,
      required this.passwordConfirmation,
      required this.firstName,
      required this.lastName,
      required this.birthDay,
      this.avatar});

  factory SignUp.fromJson(Map<String, dynamic> json) => _$SignUpFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpToJson(this);

  @override
  List<Object?> get props => [
        email,
        emailConfirmation,
        password,
        passwordConfirmation,
        firstName,
        lastName,
        avatar,
      ];
}
