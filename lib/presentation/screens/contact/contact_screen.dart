import 'package:flutter/material.dart';
import 'package:domestic_e_catalogue/core/constants/app_colors.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: AppColors.primaryTeal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Get in Touch',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryTeal,
              ),
            ),
            const SizedBox(height: 20),
            _buildContactItem(
              icon: Icons.location_on,
              title: 'Registered Office',
              content: '23, Madurai Road,\nMadurai - 625 001, Tamil Nadu, India',
            ),
            _buildContactItem(
              icon: Icons.phone,
              title: 'Phone',
              content: '+91-452-4283800',
            ),
            _buildContactItem(
              icon: Icons.email,
              title: 'Email',
              content: 'info@jkfenner.com',
            ),
            _buildContactItem(
              icon: Icons.language,
              title: 'Website',
              content: 'www.jkfenner.com',
            ),
            const SizedBox(height: 30),
            const Text(
              'Send Enquiry',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Message',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryTeal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text('SUBMIT ENQUIRY'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem({required IconData icon, required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primaryTeal, size: 28),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  content,
                  style: const TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
