import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/deposit.dart';

abstract class DepositRepository {
  Future<Either<Failure, void>> createDeposit(Deposit deposit);
  Future<Either<Failure, List<Deposit>>> getDepositHistory();
}
