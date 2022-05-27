import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'unprocessable.model.g.dart';

@JsonSerializable()
class Unprocessable extends Equatable {
  final String rule;
  final String field;
  final String message;

  const Unprocessable({
    required this.rule,
    required this.field,
    required this.message,
  });

  factory Unprocessable.fromJson(Map<String, dynamic> json) =>
      _$UnprocessableFromJson(json);

  Map<String, dynamic> toJson() => _$UnprocessableToJson(this);

  @override
  List<Object?> get props => [
        rule,
        field,
        message,
      ];
}
