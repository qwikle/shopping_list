// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unprocessable.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Unprocessable _$UnprocessableFromJson(Map<String, dynamic> json) =>
    Unprocessable(
      rule: json['rule'] as String,
      field: json['field'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$UnprocessableToJson(Unprocessable instance) =>
    <String, dynamic>{
      'rule': instance.rule,
      'field': instance.field,
      'message': instance.message,
    };
