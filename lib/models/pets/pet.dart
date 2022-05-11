import 'package:animal/models/pets/image_urls.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pet.g.dart';

@CopyWith()
@JsonSerializable()
class Pet {
  final int? id;
  final String? name;
  final String? description;
  final int? genderId;
  final int? age;
  final double? height;
  final double? weight;
  final List<ImageUrls>? imageUrls;
  final int? typeId;

  Pet({
    this.id,
    this.name,
    this.description,
    this.age,
    this.height,
    this.weight,
    this.imageUrls,
    this.typeId,
    this.genderId,
  });

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

  Map<String, dynamic> toJson() => _$PetToJson(this);
}
