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
    String? color,
    bool? sex,
    int? age,
    double? height,
    double? weight,
    List<String>? imageUrls,
    String? category,
  }) : super(
          id: id,
          name: name,
          age: age,
          category: category,
          color: color,
          height: height,
          imageUrls: imageUrls,
          sex: sex,
          weight: weight,
        );

  factory Dog.fromJson(Map<String, dynamic> json) => _$DogFromJson(json);

  Map<String, dynamic> toJson() => _$DogToJson(this);
}
