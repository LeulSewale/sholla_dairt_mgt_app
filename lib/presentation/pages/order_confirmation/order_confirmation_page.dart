import 'package:dairy_management/core/constants/app_constants.dart';
import 'package:dairy_management/presentation/pages/notification/notification.dart';
import 'package:dairy_management/presentation/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class OrderConfirmationPage extends StatelessWidget {
  final bool isAccepted;
  final Map<String, dynamic>? orderData;

  const OrderConfirmationPage({
    super.key,
    required this.isAccepted,
    this.orderData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: isAccepted
            ? _buildAcceptedOrder(context)
            : _buildRejectionForm(context),
      ),
    );
  }

  Widget _buildAcceptedOrder(BuildContext context) {
    return Scaffold(
      body: Card(
                elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: AppColors.primery,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.info,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Your Order Has arrived',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Your orders has been placed successfully, we will review and send the status soon',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 32),

              // Order Items
              _buildOrderItem('Raw Milk Per Liter', '2,000 Liter',
                  '200,000 Birr', AppColors.primery),
              const SizedBox(height: 16),
              _buildOrderItem(
                '1 Liter Shola Milk',
                '1,000 Piece',
                '192,882 Birr',
                null,
                hasImage: true,
              ),

              const SizedBox(height: 24),

              // Order Summary
              _buildSummaryRow('Sub Total', '392,882 Birr'),
              _buildSummaryRow('VAT (15%)', '58,932 Birr'),
              const Divider(),
              _buildSummaryRow('Total Amount', '451,841 Birr', isTotal: true),

              const SizedBox(height: 32),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Accept'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OrderConfirmationPage(
                              isAccepted: false,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text('Reject'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRejectionForm(BuildContext context) {
    final TextEditingController commentController = TextEditingController();

    return Card(
                elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: AppColors.primery,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.info,
                color: Colors.white,
                size: 32,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Enter the Reason for the Rejection',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Enter Comment (Optional)',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: commentController,
              maxLines: 6,
              decoration: const InputDecoration(
                hintText: 'Enter Comment',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle rejection submission
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(
      String title, String quantity, String price, Color? color,
      {bool hasImage = false}) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color ?? Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: hasImage
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    '/placeholder.svg?height=60&width=60',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.image, color: Colors.grey),
                      );
                    },
                  ),
                )
              : null,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                quantity,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        Text(
          price,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 16 : 14,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isTotal ? 16 : 14,
              color: isTotal ? Colors.blue : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
