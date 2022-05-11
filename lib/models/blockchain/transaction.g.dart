// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension TransactionCopyWith on Transaction {
  Transaction copyWith({
    String? adopterName,
    String? approvedAt,
    String? healthStatus,
    String? ownerName,
    int? petId,
  }) {
    return Transaction(
      adopterName: adopterName ?? this.adopterName,
      approvedAt: approvedAt ?? this.approvedAt,
      healthStatus: healthStatus ?? this.healthStatus,
      ownerName: ownerName ?? this.ownerName,
      petId: petId ?? this.petId,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction(
    petId: json['petId'] as int,
    ownerName: json['ownerName'] as String,
    adopterName: json['adopterName'] as String,
    approvedAt: json['approvedAt'] as String,
    healthStatus: json['healthStatus'] as String,
  );
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'petId': instance.petId,
      'ownerName': instance.ownerName,
      'adopterName': instance.adopterName,
      'approvedAt': instance.approvedAt,
      'healthStatus': instance.healthStatus,
    };
