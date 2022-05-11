import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'adoption_process.g.dart';

@CopyWith()
@JsonSerializable()
class AdoptionProcess {
  int? id;
  String? status;

  AdoptionProcess({this.id, this.status});

  factory AdoptionProcess.fromJson(Map<String, dynamic> json) => _$AdoptionProcessFromJson(json);

  Map<String, dynamic> toJson() => _$AdoptionProcessToJson(this);
}
