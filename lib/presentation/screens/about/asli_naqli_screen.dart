import 'package:flutter/material.dart';
import 'package:domestic_e_catalogue/core/constants/app_colors.dart';

class AsliNaqliScreen extends StatelessWidget {
  const AsliNaqliScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asli Naqli'),
        backgroundColor: AppColors.primaryTeal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Always Insist on Fenner Originals',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryTeal),
            ),
            const SizedBox(height: 10),
            const Text(
              'FENNER GENUINE',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 5),
            const Text('• Buy Fenner Products from Authorized Dealers and insist on invoice.\n'
                '• Ensure that you get official original equipment quality which ensures long life for your vehicle.'),
            const SizedBox(height: 20),
            const Text(
              'SPURIOUS & FENNER LOOK-ALIKES',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.red),
            ),
            const SizedBox(height: 5),
            const Text('• Spurious suppliers bypass various design or power limitations to the original equipment product.\n'
                '• Low spurious products are inferior in quality.\n'
                '• Results in poor engine performance.'),
          ],
        ),
      ),
    );
  }
}
