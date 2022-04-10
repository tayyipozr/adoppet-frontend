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
  factory Rabbit.fromJson(Map<String, dynamic> json) => _$RabbitFromJson(json);

  Map<String, dynamic> toJson() => _$RabbitToJson(this);
}
