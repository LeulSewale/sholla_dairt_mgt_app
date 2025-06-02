import 'package:dairy_management/core/constants/app_constants.dart';
import 'package:dairy_management/domain/entities/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/dashboard/dashboard_bloc.dart';
import '../../bloc/products/products_bloc.dart';
import '../../widgets/dashboard_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardBloc>().add(LoadDashboardData());
    context.read<ProductsBloc>().add(LoadProducts());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is DashboardLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is DashboardError) {
          return Center(child: Text('Error: ${state.message}'));
        }

        if (state is DashboardLoaded) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Purchasing Limit Card
                const DashboardCard(
                  icon: Icons.local_shipping_outlined,
                  title: '25,000 Liter',
                  subtitle: 'Liter Purchasing Limit',
                  description:
                      'Your Performance in fasting season will be the determinant on liter allowance.',
                ),
                const SizedBox(height: 16),

                // Balance Card
                DashboardCard(
                  icon:   CupertinoIcons.money_dollar_circle,
                  title: '${state.data.user.balance.toInt()},000 Birr',
                  subtitle: 'Your Balance',
                  description:
                      'Your Performance in fasting season will be the determinant on liter allowance.',
                  actionText: 'Recharge',
                  onActionPressed: () {
                    // Navigate to recharge
                  },
                ),
                const SizedBox(height: 24),

                // Product Catalogue Section
                const Text(
                  'Product Catalogue',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // Search and Filter Row
                Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'Search for Product',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primery,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.filter_alt_outlined,
                            color: Colors.white),
                        onPressed: () {
                          // Show filter options
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Product Grid
                const ProductGrid(isLimited: true),
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}

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
            shrinkWrap: true,
            physics: isLimited ? const NeverScrollableScrollPhysics() : null,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
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

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Important for shrink-wrap
        children: [
          // Product Image
          Container(
            width: double.infinity,
            height: 140,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: product.imageUrl.isNotEmpty
                  ? Image.asset(
                      product.imageUrl, // e.g. 'assets/images/milk_pack.png'
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Icon(Icons.image,
                              size: 50, color: Colors.grey),
                        );
                      },
                    )
                  : Container(
                      color: Colors.grey[300],
                      child:
                          const Icon(Icons.image, size: 50, color: Colors.grey),
                    ),
            ),
          ),

          // Product Details
          Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  product.description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                const Divider(
                  height: 1,
                  color: AppColors.primery,
                ),
                Text(
                  '${product.price.toInt()} Birr',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
