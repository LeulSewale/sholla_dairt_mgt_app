import '../../domain/entities/deposit.dart';

class DepositModel extends Deposit {
  const DepositModel({
    required super.id,
    required super.bankName,
    required super.accountNumber,
    required super.accountName,
    required super.amount,
    required super.remark,
    super.imageUrl,
    required super.status,
    required super.createdAt,
  });

  factory DepositModel.fromJson(Map<String, dynamic> json) {
    return DepositModel(
      id: json['id'],
      bankName: json['bank_name'],
      accountNumber: json['account_number'],
      accountName: json['account_name'],
      amount: json['amount'].toDouble(),
      remark: json['remark'],
      imageUrl: json['image_url'],
      status: DepositStatus.values.firstWhere(
        (e) => e.toString().split('.').last == json['status'],
      ),
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bank_name': bankName,
      'account_number': accountNumber,
      'account_name': accountName,
      'amount': amount,
      'remark': remark,
      'image_url': imageUrl,
      'status': status.toString().split('.').last,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
