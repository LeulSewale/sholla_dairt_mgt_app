import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/deposit.dart';
import '../../domain/repositories/deposit_repository.dart';
import '../datasources/local/local_data_source.dart';
import '../datasources/remote/remote_data_source.dart';
import '../models/deposit_model.dart';

class DepositRepositoryImpl implements DepositRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  DepositRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, void>> createDeposit(Deposit deposit) async {
    try {
      final depositModel = DepositModel(
        id: deposit.id,
        bankName: deposit.bankName,
        accountNumber: deposit.accountNumber,
        accountName: deposit.accountName,
        amount: deposit.amount,
        remark: deposit.remark,
        imageUrl: deposit.imageUrl,
        status: deposit.status,
        createdAt: deposit.createdAt,
      );
      await remoteDataSource.createDeposit(depositModel);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Deposit>>> getDepositHistory() async {
    try {
      final deposits = await remoteDataSource.getDepositHistory();
      return Right(deposits);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
