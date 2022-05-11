// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adoption_process.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension AdoptionProcessCopyWith on AdoptionProcess {
  AdoptionProcess copyWith({
    int? id,
    String? status,
  }) {
    return AdoptionProcess(
      id: id ?? this.id,
      status: status ?? this.status,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdoptionProcess _$AdoptionProcessFromJson(Map<String, dynamic> json) {
  return AdoptionProcess(
    id: json['id'] as int?,
    status: json['status'] as String?,
  );
}

Map<String, dynamic> _$AdoptionProcessToJson(AdoptionProcess instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
    };
