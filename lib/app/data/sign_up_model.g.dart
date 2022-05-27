// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUp _$SignUpFromJson(Map<String, dynamic> json) => SignUp(
      email: json['email'] as String,
      emailConfirmation: json['emailConfirmation'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['passwordConfirmation'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      birthDay: DateTime.parse(json['birthDay'] as String),
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$SignUpToJson(SignUp instance) => <String, dynamic>{
      'email': instance.email,
      'emailConfirmation': instance.emailConfirmation,
      'password': instance.password,
      'passwordConfirmation': instance.passwordConfirmation,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthDay': instance.birthDay.toIso8601String(),
      'avatar': instance.avatar,
    };
