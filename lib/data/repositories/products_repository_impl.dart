import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/products_repository.dart';
import '../datasources/local/local_data_source.dart';
import '../datasources/remote/remote_data_source.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  ProductsRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final products = await remoteDataSource.getProducts();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Product>> getProductById(String id) async {
    try {
      final products = await remoteDataSource.getProducts();
      final product = products.firstWhere((p) => p.id == id);
      return Right(product);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
