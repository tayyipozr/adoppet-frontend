import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@CopyWith()
@JsonSerializable()
class User {
  int id;
  String createdAt;
  String updatedAt;
  String email;
  String? firstName;
  String? lastName;
  bool? gender;
  int? addressId;

  User(this.id, this.createdAt, this.updatedAt, this.email,
      {this.firstName, this.lastName, this.gender, this.addressId});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
