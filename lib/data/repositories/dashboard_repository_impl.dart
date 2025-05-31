import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/dashboard_data.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/local/local_data_source.dart';
import '../datasources/remote/remote_data_source.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  DashboardRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, DashboardData>> getDashboardData() async {
    try {
      final user = await localDataSource.getCachedUserData();
      final products = await remoteDataSource.getProducts();
      
      if (user != null) {
        final dashboardData = DashboardData(
          user: user,
          featuredProducts: products.take(2).toList(),
          totalSales: 1500000,
          totalOrders: 150,
        );
        return Right(dashboardData);
      } else {
        return const Left(CacheFailure('User not found'));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
