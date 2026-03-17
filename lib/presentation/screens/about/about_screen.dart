import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About FENNER'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'J.K. Fenner (India) Limited',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryTeal,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'J.K. Fenner (India) Limited is a member of the J.K. Organization, one of the top industrial houses in India. For over 100 years, Fenner has been the leader in Mechanical Power Transmission products.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 20),
            Text(
              'Our Products',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.darkGrey,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '• Belts (V-Belts, Fan Belts, Poly-V Belts)\n'
              '• Oil Seals\n'
              '• Hoses\n'
              '• Engineering Products',
              style: TextStyle(fontSize: 16, height: 1.8),
            ),
            SizedBox(height: 24),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.darkGrey,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '23, Madurai Road, Madurai - 625 001\n'
              'Tamil Nadu, India\n'
              'Email: info@jkfenner.com\n'
              'Web: www.jkfenner.com',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
