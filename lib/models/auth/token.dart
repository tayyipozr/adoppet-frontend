import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@CopyWith()
@JsonSerializable()
class Token {
  final String access_token;
  final String refresh_token;

  const Token({
    required this.access_token,
    required this.refresh_token,
  });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
