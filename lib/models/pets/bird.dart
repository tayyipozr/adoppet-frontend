import 'package:animal/models/pets/pet.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bird.g.dart';

@CopyWith()
@JsonSerializable()
class Bird extends Pet {
  Bird({
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
  factory Bird.fromJson(Map<String, dynamic> json) => _$BirdFromJson(json);

  Map<String, dynamic> toJson() => _$BirdToJson(this);
}
