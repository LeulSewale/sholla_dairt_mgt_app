import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/usecases/products/get_products_usecase.dart';
import '../../../core/usecases/usecase.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsUseCase getProductsUseCase;

  ProductsBloc(this.getProductsUseCase) : super(ProductsInitial()) {
    on<LoadProducts>(_onLoadProducts);
  }

  void _onLoadProducts(LoadProducts event, Emitter<ProductsState> emit) async {
    emit(ProductsLoading());
    
    final result = await getProductsUseCase(NoParams());
    
    result.fold(
      (failure) => emit(ProductsError(failure.message)),
      (products) => emit(ProductsLoaded(products)),
    );
  }
}
