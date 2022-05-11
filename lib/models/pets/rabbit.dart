import 'package:animal/models/pets/image_urls.dart';
import 'package:animal/models/pets/pet.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rabbit.g.dart';

@CopyWith()
@JsonSerializable()
class Rabbit extends Pet {
  Rabbit({
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
  factory Rabbit.fromJson(Map<String, dynamic> json) => _$RabbitFromJson(json);

  Map<String, dynamic> toJson() => _$RabbitToJson(this);
}
