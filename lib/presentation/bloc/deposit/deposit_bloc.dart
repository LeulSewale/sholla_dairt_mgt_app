import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/deposit.dart';
import '../../../domain/usecases/deposit/create_deposit_usecase.dart';
import '../../../domain/usecases/deposit/get_deposit_history_usecase.dart';
import '../../../core/usecases/usecase.dart';

part 'deposit_event.dart';
part 'deposit_state.dart';

class DepositBloc extends Bloc<DepositEvent, DepositState> {
  final CreateDepositUseCase createDepositUseCase;
  final GetDepositHistoryUseCase getDepositHistoryUseCase;

  DepositBloc(this.createDepositUseCase, this.getDepositHistoryUseCase) 
      : super(DepositInitial()) {
    on<CreateDeposit>(_onCreateDeposit);
    on<LoadDepositHistory>(_onLoadDepositHistory);
  }

  void _onCreateDeposit(CreateDeposit event, Emitter<DepositState> emit) async {
    emit(DepositLoading());
    
    final deposit = Deposit(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      bankName: event.bankName,
      accountNumber: event.accountNumber,
      accountName: event.accountName,
      amount: event.amount,
      remark: event.remark,
      imageUrl: event.imagePath,
      status: DepositStatus.pending,
      createdAt: DateTime.now(),
    );
    
    final result = await createDepositUseCase(deposit);
    
    result.fold(
      (failure) => emit(DepositError(failure.message)),
      (_) {
        emit(DepositCreated());
        add(LoadDepositHistory());
      },
    );
  }

  void _onLoadDepositHistory(LoadDepositHistory event, Emitter<DepositState> emit) async {
    emit(DepositLoading());
    
    final result = await getDepositHistoryUseCase(NoParams());
    
    result.fold(
      (failure) => emit(DepositError(failure.message)),
      (deposits) => emit(DepositLoaded(deposits)),
    );
  }
}
