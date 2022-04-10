import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@CopyWith()
@JsonSerializable()
class Address {
  final int? id;
  final String? addressType;
  final String? street;
  final String? city;
  final String? district;
  final String? country;
  final String? postalCode;

  Address({this.id, this.addressType, this.street, this.city, this.district, this.country, this.postalCode});

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
