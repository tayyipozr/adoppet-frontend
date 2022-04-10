import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@CopyWith()
@JsonSerializable()
class User {
  final int? id;
  final String? name;
  final String? surname;
  final bool? sex;
  final int? age;
  final List<String>? imageUrls;
  final List<int>? favorites;
  final List<int>? adopted;

  User({this.id, this.name, this.surname, this.sex, this.age, this.imageUrls, this.favorites, this.adopted});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
