import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pet.g.dart';

@CopyWith()
@JsonSerializable()
class Pet {
  final int? id;
  final String? name;
  final String? color;
  final bool? sex;
  final int? age;
  final double? height;
  final double? weight;
  final List<String>? imageUrls;
  final String? category;

  Pet({this.id, this.name, this.color, this.sex, this.age, this.height, this.weight, this.imageUrls, this.category});

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

  Map<String, dynamic> toJson() => _$PetToJson(this);
}
