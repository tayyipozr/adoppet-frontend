import 'package:animal/models/adopt/adoption_process.dart';
import 'package:animal/models/pets/image_urls.dart';
import 'package:animal/models/pets/pet.dart';
import 'package:animal/models/user/user.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'adoption.g.dart';

@CopyWith()
@JsonSerializable()
class Adoption {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? petId;
  int? userId;
  int? adoptionProcessId;
  Pet? pet;
  User? user;
  AdoptionProcess? adoptionProcess;
  String? url;
  ImageUrls? imageUrls;

  Adoption({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.petId,
    this.userId,
    this.adoptionProcessId,
    this.pet,
    this.user,
    this.adoptionProcess,
    this.url,
    this.imageUrls,
  });

  factory Adoption.fromJson(Map<String, dynamic> json) => _$AdoptionFromJson(json);

  Map<String, dynamic> toJson() => _$AdoptionToJson(this);
}
