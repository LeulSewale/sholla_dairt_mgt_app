import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/deposit.dart';
import '../../repositories/deposit_repository.dart';

class CreateDepositUseCase implements UseCase<void, Deposit> {
  final DepositRepository repository;

  CreateDepositUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(Deposit params) async {
    return await repository.createDeposit(params);
  }
}
