import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/product.dart';
import '../../repositories/products_repository.dart';

class GetProductsUseCase implements UseCase<List<Product>, NoParams> {
  final ProductsRepository repository;

  GetProductsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) async {
    return await repository.getProducts();
  }
}
