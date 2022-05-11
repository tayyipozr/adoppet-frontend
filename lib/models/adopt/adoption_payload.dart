import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'adoption_payload.g.dart';

@CopyWith()
@JsonSerializable()
class AdoptionPayload {
  final String title;
  final String body;
  final String type;

  AdoptionPayload({
    required this.title,
    required this.body,
    required this.type,
  });

  factory AdoptionPayload.fromJson(Map<String, dynamic> json) => _$AdoptionPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$AdoptionPayloadToJson(this);
}
