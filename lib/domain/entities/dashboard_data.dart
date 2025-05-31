import 'package:equatable/equatable.dart';
import 'user.dart';
import 'product.dart';

class DashboardData extends Equatable {
  final User user;
  final List<Product> featuredProducts;
  final double totalSales;
  final int totalOrders;

  const DashboardData({
    required this.user,
    required this.featuredProducts,
    required this.totalSales,
    required this.totalOrders,
  });

  @override
  List<Object> get props => [user, featuredProducts, totalSales, totalOrders];
}
