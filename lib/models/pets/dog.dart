import 'package:animal/models/pets/image_urls.dart';
import 'package:animal/models/pets/pet.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dog.g.dart';

@CopyWith()
@JsonSerializable()
class Dog extends Pet {
  Dog({
    int? id,
    String? name,
    String? description,
    int? genderId,
    int? age,
    double? height,
    double? weight,
    List<ImageUrls>? imageUrls,
    int? typeId,
  }) : super(
          id: id,
          name: name,
          age: age,
          typeId: typeId,
          height: height,
          imageUrls: imageUrls,
          genderId: genderId,
          weight: weight,
          description: description,
        );

  factory Dog.fromJson(Map<String, dynamic> json) => _$DogFromJson(json);

  Map<String, dynamic> toJson() => _$DogToJson(this);
}
