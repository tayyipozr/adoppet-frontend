// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension UserCopyWith on User {
  User copyWith({
    List<int>? adopted,
    int? age,
    List<int>? favorites,
    int? id,
    List<String>? imageUrls,
    String? name,
    bool? sex,
    String? surname,
  }) {
    return User(
      adopted: adopted ?? this.adopted,
      age: age ?? this.age,
      favorites: favorites ?? this.favorites,
      id: id ?? this.id,
      imageUrls: imageUrls ?? this.imageUrls,
      name: name ?? this.name,
      sex: sex ?? this.sex,
      surname: surname ?? this.surname,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int?,
    name: json['name'] as String?,
    surname: json['surname'] as String?,
    sex: json['sex'] as bool?,
    age: json['age'] as int?,
    imageUrls:
        (json['imageUrls'] as List<dynamic>?)?.map((e) => e as String).toList(),
    favorites:
        (json['favorites'] as List<dynamic>?)?.map((e) => e as int).toList(),
    adopted: (json['adopted'] as List<dynamic>?)?.map((e) => e as int).toList(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'sex': instance.sex,
      'age': instance.age,
      'imageUrls': instance.imageUrls,
      'favorites': instance.favorites,
      'adopted': instance.adopted,
    };
