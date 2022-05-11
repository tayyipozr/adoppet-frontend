// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fish.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension FishCopyWith on Fish {
  Fish copyWith({
    int? age,
    String? description,
    int? genderId,
    double? height,
    int? id,
    List<ImageUrls>? imageUrls,
    String? name,
    int? typeId,
    double? weight,
  }) {
    return Fish(
      age: age ?? this.age,
      description: description ?? this.description,
      genderId: genderId ?? this.genderId,
      height: height ?? this.height,
      id: id ?? this.id,
      imageUrls: imageUrls ?? this.imageUrls,
      name: name ?? this.name,
      typeId: typeId ?? this.typeId,
      weight: weight ?? this.weight,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fish _$FishFromJson(Map<String, dynamic> json) {
  return Fish(
    id: json['id'] as int?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    genderId: json['genderId'] as int?,
    age: json['age'] as int?,
    height: (json['height'] as num?)?.toDouble(),
    weight: (json['weight'] as num?)?.toDouble(),
    imageUrls: (json['imageUrls'] as List<dynamic>?)
        ?.map((e) => ImageUrls.fromJson(e as Map<String, dynamic>))
        .toList(),
    typeId: json['typeId'] as int?,
  );
}

Map<String, dynamic> _$FishToJson(Fish instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'genderId': instance.genderId,
      'age': instance.age,
      'height': instance.height,
      'weight': instance.weight,
      'imageUrls': instance.imageUrls,
      'typeId': instance.typeId,
    };
