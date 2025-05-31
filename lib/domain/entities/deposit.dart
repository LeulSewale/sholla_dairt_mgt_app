import 'package:equatable/equatable.dart';

enum DepositStatus { pending, accepted, rejected }

class Deposit extends Equatable {
  final String id;
  final String bankName;
  final String accountNumber;
  final String accountName;
  final double amount;
  final String remark;
  final String? imageUrl;
  final DepositStatus status;
  final DateTime createdAt;

  const Deposit({
    required this.id,
    required this.bankName,
    required this.accountNumber,
    required this.accountName,
    required this.amount,
    required this.remark,
    this.imageUrl,
    required this.status,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        bankName,
        accountNumber,
        accountName,
        amount,
        remark,
        imageUrl,
        status,
        createdAt,
      ];
}
