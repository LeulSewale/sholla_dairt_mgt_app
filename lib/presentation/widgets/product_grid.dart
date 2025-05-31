import 'package:dairy_management/presentation/bloc/products/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  final bool isLimited;

  const ProductGrid({super.key, this.isLimited = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ProductsError) {
          return Center(child: Text('Error: ${state.message}'));
        }

        if (state is ProductsLoaded) {
          final products =
              isLimited ? state.products.take(2).toList() : state.products;

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio:
                  0.62, // was 0.7, now more vertical space per card
              crossAxisSpacing: 1,
              mainAxisSpacing: 8,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
