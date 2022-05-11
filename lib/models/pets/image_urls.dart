import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_urls.g.dart';

@CopyWith()
@JsonSerializable()
class ImageUrls {
  final int? id;
  final int? petId;
  final String? url;

  ImageUrls({
    this.id,
    this.petId,
    this.url,
  });

  factory ImageUrls.fromJson(Map<String, dynamic> json) => _$ImageUrlsFromJson(json);

  Map<String, dynamic> toJson() => _$ImageUrlsToJson(this);
}
