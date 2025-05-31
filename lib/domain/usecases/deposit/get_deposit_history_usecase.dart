import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/deposit.dart';
import '../../repositories/deposit_repository.dart';

class GetDepositHistoryUseCase implements UseCase<List<Deposit>, NoParams> {
  final DepositRepository repository;

  GetDepositHistoryUseCase(this.repository);

  @override
  Future<Either<Failure, List<Deposit>>> call(NoParams params) async {
    return await repository.getDepositHistory();
  }
}
