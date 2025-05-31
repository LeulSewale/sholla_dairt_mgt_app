import 'package:dairy_management/core/constants/app_constants.dart';
import 'package:dairy_management/presentation/pages/cart/cart_page.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double aspectRatio = width / height;
    return LayoutBuilder(builder: (context, constraints) {
      return ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 280),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: Container(
                  width: double.infinity,
                  height: height * 0.12, // Adjust height based on screen size
                  color: Colors.white,
                  child: product.imageUrl.isNotEmpty
                      ? Image.asset(
                          product.imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: height * 0.12,
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
                          child: const Icon(Icons.image,
                              size: 40, color: Colors.grey),
                        ),
                ),
              ),

              // Detail Section
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 10,
                          letterSpacing: 0.1,
                          height: 1,
                        ),
                      ),
                      Text(
                        product.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[600],
                          letterSpacing: 0.3,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Divider(height: 1, color: AppColors.primery),
                      const SizedBox(height: 4),
                      Text(
                        '${product.price.toInt()} Birr',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton.icon(
                          icon: const Icon(Icons.shopping_cart, size: 14),
                          label: const Text(
                            'Add to Cart',
                            style: TextStyle(fontSize: 12),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            foregroundColor: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.shopping_bag, size: 14),
                          label: const Text(
                            'Purchase Now',
                            style: TextStyle(fontSize: 12),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CartPage(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
