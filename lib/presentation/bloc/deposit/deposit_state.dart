part of 'deposit_bloc.dart';

abstract class DepositState extends Equatable {
  const DepositState();

  @override
  List<Object> get props => [];
}

class DepositInitial extends DepositState {}

class DepositLoading extends DepositState {}

class DepositCreated extends DepositState {}

class DepositLoaded extends DepositState {
  final List<Deposit> deposits;

  const DepositLoaded(this.deposits);

  @override
  List<Object> get props => [deposits];
}

class DepositError extends DepositState {
  final String message;

  const DepositError(this.message);

  @override
  List<Object> get props => [message];
}
