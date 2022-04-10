// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bird.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension BirdCopyWith on Bird {
  Bird copyWith({
    int? age,
    String? category,
    String? color,
    double? height,
    int? id,
    List<String>? imageUrls,
    String? name,
    bool? sex,
    double? weight,
  }) {
    return Bird(
      age: age ?? this.age,
      category: category ?? this.category,
      color: color ?? this.color,
      height: height ?? this.height,
      id: id ?? this.id,
      imageUrls: imageUrls ?? this.imageUrls,
      name: name ?? this.name,
      sex: sex ?? this.sex,
      weight: weight ?? this.weight,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bird _$BirdFromJson(Map<String, dynamic> json) {
  return Bird(
    id: json['id'] as int?,
    name: json['name'] as String?,
    color: json['color'] as String?,
    sex: json['sex'] as bool?,
    age: json['age'] as int?,
    height: (json['height'] as num?)?.toDouble(),
    weight: (json['weight'] as num?)?.toDouble(),
    imageUrls:
        (json['imageUrls'] as List<dynamic>?)?.map((e) => e as String).toList(),
    category: json['category'] as String?,
  );
}

Map<String, dynamic> _$BirdToJson(Bird instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'sex': instance.sex,
      'age': instance.age,
      'height': instance.height,
      'weight': instance.weight,
      'imageUrls': instance.imageUrls,
      'category': instance.category,
    };
