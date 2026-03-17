import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../data/models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'FENNER',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryTeal,
                letterSpacing: 2,
              ),
            ),
            const Text(
              'J.K. Fenner (India) Limited',
              style: TextStyle(fontSize: 14, color: AppColors.grey),
            ),
            const Divider(height: 32),
            _buildDetailRow('Application', product.application, isBold: true),
            _buildDetailRow('JKV Part No', product.partNo),
            _buildDetailRow('Reference Part No', product.referenceNo),
            _buildDetailRow('Price', '₹ ${product.price.toStringAsFixed(2)}', valueColor: AppColors.primaryTeal),
            _buildDetailRow('Belt Type', product.type),
            if (product.innerDiameter != null)
              _buildDetailRow('Inner Diameter (mm)', product.innerDiameter.toString()),
            if (product.outerDiameter != null)
              _buildDetailRow('Outer Diameter (mm)', product.outerDiameter.toString()),
            if (product.thickness != null)
              _buildDetailRow('Thickness (mm)', product.thickness.toString()),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Contact enquiry action
                },
                icon: const Icon(Icons.email),
                label: const Text('Contact Enquiry'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryTeal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              '* Maximum retail price is inclusive of all taxes, make sure you check the latest version of the price list.',
              style: TextStyle(fontSize: 11, color: Colors.grey, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isBold = false, Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              color: valueColor ?? AppColors.black,
            ),
          ),
          const Divider(thickness: 0.5),
        ],
      ),
    );
  }
}
