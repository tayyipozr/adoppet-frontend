// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_urls.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension ImageUrlsCopyWith on ImageUrls {
  ImageUrls copyWith({
    int? id,
    int? petId,
    String? url,
  }) {
    return ImageUrls(
      id: id ?? this.id,
      petId: petId ?? this.petId,
      url: url ?? this.url,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageUrls _$ImageUrlsFromJson(Map<String, dynamic> json) {
  return ImageUrls(
    id: json['id'] as int?,
    petId: json['petId'] as int?,
    url: json['url'] as String?,
  );
}

Map<String, dynamic> _$ImageUrlsToJson(ImageUrls instance) => <String, dynamic>{
      'id': instance.id,
      'petId': instance.petId,
      'url': instance.url,
    };
