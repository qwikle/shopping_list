import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
class Token extends Equatable {
  final String type;
  final String token;

  const Token({
    required this.type,
    required this.token,
  });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);

  copyWith({
    String? type,
    String? token,
    DateTime? expiresAt,
  }) {
    return Token(
      type: type ?? this.type,
      token: token ?? this.token,
    );
  }

  @override
  List<Object?> get props => [type, token];
}
