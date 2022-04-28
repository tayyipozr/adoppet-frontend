// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension AuthCopyWith on Auth {
  Auth copyWith({
    String? email,
    String? firstName,
    String? lastName,
    String? password,
  }) {
    return Auth(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth _$AuthFromJson(Map<String, dynamic> json) {
  return Auth(
    email: json['email'] as String,
    password: json['password'] as String,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
  );
}

Map<String, dynamic> _$AuthToJson(Auth instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
