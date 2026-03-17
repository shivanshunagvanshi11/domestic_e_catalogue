import 'package:flutter/material.dart';
import 'package:domestic_e_catalogue/core/constants/app_colors.dart';
import 'package:domestic_e_catalogue/presentation/screens/manufacturer/manufacturer_screen.dart';
import 'package:domestic_e_catalogue/presentation/screens/search/search_screen.dart';

class CategorySelectionScreen extends StatelessWidget {
  final String vehicleType;

  const CategorySelectionScreen({super.key, required this.vehicleType});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {'name': 'Belts', 'image': 'assets/images/belts_cat.png'},
      {'name': 'Oilseals', 'image': 'assets/images/oilseals_cat.png'},
      {'name': 'New Auto Products', 'image': 'assets/images/new_products_cat.png'},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryTeal,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Row(
                children: [
                  Container(
                    color: AppColors.darkGrey,
                    padding: const EdgeInsets.all(2),
                    child: const Text('F', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  const Text(' Fenner', style: TextStyle(color: AppColors.primaryTeal, fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('AUTOMOBILE', style: TextStyle(fontSize: 10, color: Colors.white70)),
                Text('AFTER MARKET DOMESTIC', style: TextStyle(fontSize: 10, color: Colors.white70)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.grey[200],
            child: Text(
              vehicleType,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: categories.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final category = categories[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  leading: SizedBox(
                    width: 80,
                    height: 60,
                    child: Image.asset(
                      category['image']!,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Icon(
                        _getCategoryIcon(category['name']!),
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  trailing: Text(
                    category['name']!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryTeal,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ManufacturerScreen(
                          vehicleType: vehicleType,
                          category: category['name']!,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String name) {
    if (name.contains('Belts')) return Icons.settings_input_component;
    if (name.contains('Oilseals')) return Icons.radio_button_checked;
    return Icons.new_releases;
  }
}
