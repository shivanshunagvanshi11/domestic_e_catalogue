import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class AnnouncementsScreen extends StatelessWidget {
  const AnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> announcements = [
      {
        'title': 'New Launch - Drum Rubber',
        'subtitle': 'OR Mx Drum Rubber 32 / 25-36',
        'date': '11-Oct-2023',
      },
      {
        'title': 'New Launch - UJ Cross',
        'subtitle': 'OR Mx UVM 02 / 01-22',
        'date': '19-Sep-2023',
      },
      {
        'title': 'New Launch - Lubricants',
        'subtitle': 'OR Mx Lubricants 07 / 33-06',
        'date': '11-Sep-2023',
      },
      {
        'title': 'New Launch - Hoses',
        'subtitle': 'OR Mx Hoses 02 / 05-18',
        'date': '11-Sep-2023',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Announcements'),
      ),
      body: ListView.separated(
        itemCount: announcements.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final item = announcements[index];
          return ListTile(
            contentPadding: const EdgeInsets.all(16),
            title: Text(
              item['title']!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryTeal,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(item['subtitle']!),
                const SizedBox(height: 8),
                Text(
                  item['date']!,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
