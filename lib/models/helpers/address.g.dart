// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension AddressCopyWith on Address {
  Address copyWith({
    String? addressType,
    String? city,
    String? country,
    String? district,
    int? id,
    String? postalCode,
    String? street,
  }) {
    return Address(
      addressType: addressType ?? this.addressType,
      city: city ?? this.city,
      country: country ?? this.country,
      district: district ?? this.district,
      id: id ?? this.id,
      postalCode: postalCode ?? this.postalCode,
      street: street ?? this.street,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    id: json['id'] as int?,
    addressType: json['addressType'] as String?,
    street: json['street'] as String?,
    city: json['city'] as String?,
    district: json['district'] as String?,
    country: json['country'] as String?,
    postalCode: json['postalCode'] as String?,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'addressType': instance.addressType,
      'street': instance.street,
      'city': instance.city,
      'district': instance.district,
      'country': instance.country,
      'postalCode': instance.postalCode,
    };
