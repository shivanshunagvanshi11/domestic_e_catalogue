import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class TechnicalInfoScreen extends StatelessWidget {
  const TechnicalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Technical Info'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'JK Pioneer Oil Seals',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryTeal,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'DC PRECISELY DESIGNED AND MADE, IT\'S YOUR SEAL OF CONFIDENCE',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'JK Pioneer Oil Seal provides an effective sealing for wide range of applications. It prevents leakages and ensures performance.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            // Placeholder for the technical diagram image
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.grey[200],
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image, size: 50, color: Colors.grey),
                    Text('Oil Seal Structure Diagram', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Salient Features:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            _buildFeatureItem('1. Sealing lip:', 'Low friction design minimizes heat and power loss.'),
            _buildFeatureItem('2. Garter spring:', 'Maintains constant pressure on shaft.'),
            _buildFeatureItem('3. Dust lip:', 'Prevents entry of dust and dirt.'),
            _buildFeatureItem('4. Outer shell:', 'Ensures firm fit in the housing.'),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black, fontSize: 14),
          children: [
            TextSpan(text: title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const TextSpan(text: ' '),
            TextSpan(text: description),
          ],
        ),
      ),
    );
  }
}
