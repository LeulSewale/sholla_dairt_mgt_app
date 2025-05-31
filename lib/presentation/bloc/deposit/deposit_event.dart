part of 'deposit_bloc.dart';

abstract class DepositEvent extends Equatable {
  const DepositEvent();

  @override
  List<Object?> get props => [];
}

class CreateDeposit extends DepositEvent {
  final String bankName;
  final String accountNumber;
  final String accountName;
  final double amount;
  final String remark;
  final String? imagePath;

  const CreateDeposit({
    required this.bankName,
    required this.accountNumber,
    required this.accountName,
    required this.amount,
    required this.remark,
    this.imagePath,
  });

  @override
  List<Object?> get props => [bankName, accountNumber, accountName, amount, remark, imagePath];
}

class LoadDepositHistory extends DepositEvent {}
