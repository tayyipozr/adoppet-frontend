import 'package:animal/models/pets/pet.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fish.g.dart';

@CopyWith()
@JsonSerializable()
class Fish extends Pet {
  Fish({
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

  factory Fish.fromJson(Map<String, dynamic> json) => _$FishFromJson(json);

  Map<String, dynamic> toJson() => _$FishToJson(this);
}
