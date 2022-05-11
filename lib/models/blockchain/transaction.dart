import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@CopyWith()
@JsonSerializable()
class Transaction {
  final int petId;
  final String ownerName;
  final String adopterName;
  final String approvedAt;
  final String healthStatus;

  const Transaction({
    required this.petId,
    required this.ownerName,
    required this.adopterName,
    required this.approvedAt,
    required this.healthStatus,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
