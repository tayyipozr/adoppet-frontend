import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

@CopyWith()
@JsonSerializable()
class Auth {
  final String email;
  final String password;
  final String? firstName;
  final String? lastName;

  const Auth({
    required this.email,
    required this.password,
    this.firstName,
    this.lastName,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  Map<String, dynamic> toJson() => _$AuthToJson(this);
}
