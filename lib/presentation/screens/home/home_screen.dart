import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:domestic_e_catalogue/presentation/providers/catalog_provider.dart';
import 'package:domestic_e_catalogue/core/constants/app_colors.dart';
import 'package:domestic_e_catalogue/presentation/widgets/drawer_menu.dart';
import 'package:domestic_e_catalogue/presentation/screens/search/search_screen.dart';
import 'package:domestic_e_catalogue/presentation/screens/categories/category_selection_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CatalogProvider>(context);
    final vehicles = provider.vehicles;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryTeal,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
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
      drawer: const DrawerMenu(),
      body: Column(
        children: [
          // Announcements Banner
          Container(
            color: const Color(0xFFFFF9C4), // Light Yellow
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  color: Colors.amber,
                  child: const Text('5', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                const Expanded(
                  child: Text(
                    'Announcements',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Vehicle List
          Expanded(
            child: ListView.separated(
              itemCount: vehicles.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final vehicle = vehicles[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  leading: SizedBox(
                    width: 60,
                    child: Icon(_getVehicleIcon(vehicle.name), size: 40, color: Colors.grey),
                  ),
                  title: Text(
                    vehicle.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryTeal,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CategorySelectionScreen(vehicleType: vehicle.name),
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

  IconData _getVehicleIcon(String name) {
    switch (name.toUpperCase()) {
      case '2 WHEELER':
        return Icons.motorcycle;
      case '3 WHEELER':
        return Icons.electric_rickshaw;
      case 'CAR':
        return Icons.directions_car;
      case 'HEAVY COMMERCIAL VEHICLE':
        return Icons.local_shipping;
      case 'LIGHT COMMERCIAL VEHICLE':
        return Icons.delivery_dining;
      case 'TRACTORS':
        return Icons.agriculture;
      default:
        return Icons.precision_manufacturing;
    }
  }
}
