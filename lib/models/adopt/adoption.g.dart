// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adoption.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension AdoptionCopyWith on Adoption {
  Adoption copyWith({
    AdoptionProcess? adoptionProcess,
    int? adoptionProcessId,
    String? createdAt,
    int? id,
    Pet? pet,
    int? petId,
    String? updatedAt,
    User? user,
    int? userId,
  }) {
    return Adoption(
      adoptionProcess: adoptionProcess ?? this.adoptionProcess,
      adoptionProcessId: adoptionProcessId ?? this.adoptionProcessId,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      pet: pet ?? this.pet,
      petId: petId ?? this.petId,
      updatedAt: updatedAt ?? this.updatedAt,
      user: user ?? this.user,
      userId: userId ?? this.userId,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Adoption _$AdoptionFromJson(Map<String, dynamic> json) {
  return Adoption(
    id: json['id'] as int?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    petId: json['petId'] as int?,
    userId: json['userId'] as int?,
    adoptionProcessId: json['adoptionProcessId'] as int?,
    pet: json['pet'] == null
        ? null
        : Pet.fromJson(json['pet'] as Map<String, dynamic>),
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    adoptionProcess: json['adoptionProcess'] == null
        ? null
        : AdoptionProcess.fromJson(
            json['adoptionProcess'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AdoptionToJson(Adoption instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'petId': instance.petId,
      'userId': instance.userId,
      'adoptionProcessId': instance.adoptionProcessId,
      'pet': instance.pet,
      'user': instance.user,
      'adoptionProcess': instance.adoptionProcess,
    };
