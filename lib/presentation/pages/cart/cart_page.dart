import 'package:dairy_management/core/constants/app_constants.dart';
import 'package:dairy_management/presentation/pages/notification/notification.dart';
import 'package:dairy_management/presentation/pages/order_success/order_success_page.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FC),
      appBar: AppBar(
        title: const Text(
          'Product Catalogue',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: AppColors.primery),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cart',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildCartCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCartCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildCartItem(
              imagePath: 'assets/images/shola2.png',
              name: 'Raw Milk Per Liter',
              quantity: '2,000 Liter',
              price: '200,000',
            ),
            const SizedBox(height: 12),
            _buildCartItem(
              imagePath: 'assets/images/shola3.png',
              name: '1 Liter Shola Milk',
              quantity: '1,000 Piece',
              price: '192,882',
            ),
            const SizedBox(height: 20),
            _buildPriceSummary(),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0C4B88),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                label: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Place Order Now',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(width: 8), // Add space between text and icon
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderSuccessPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem({
    required String imagePath,
    required String name,
    required String quantity,
    required String price,
  }) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14)),
              const SizedBox(height: 4),
              Text(quantity,
                  style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
        Text(price,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ],
    );
  }

  Widget _buildPriceSummary() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FB),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSummaryRow('Sub Total', '392,882 Birr'),
          const SizedBox(height: 6),
          _buildSummaryRow('VAT (15%)', '58,932 Birr'),
          const Divider(height: 24, color: Color(0xFF0C4B88)),
          _buildSummaryRow('Total Amount', '451,841 Birr',
              valueColor: const Color(0xFF0C4B88), isBold: true),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value,
      {Color valueColor = Colors.black, bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            )),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
