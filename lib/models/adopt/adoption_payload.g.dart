// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adoption_payload.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension AdoptionPayloadCopyWith on AdoptionPayload {
  AdoptionPayload copyWith({
    String? body,
    String? title,
    String? type,
  }) {
    return AdoptionPayload(
      body: body ?? this.body,
      title: title ?? this.title,
      type: type ?? this.type,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdoptionPayload _$AdoptionPayloadFromJson(Map<String, dynamic> json) {
  return AdoptionPayload(
    title: json['title'] as String,
    body: json['body'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$AdoptionPayloadToJson(AdoptionPayload instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'type': instance.type,
    };
