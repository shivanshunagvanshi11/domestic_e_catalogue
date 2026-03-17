import 'package:flutter/material.dart';
import 'package:domestic_e_catalogue/core/constants/app_colors.dart';
import 'package:domestic_e_catalogue/presentation/screens/product_list/product_list_screen.dart';
import 'package:domestic_e_catalogue/presentation/screens/search/search_screen.dart';

class ManufacturerScreen extends StatefulWidget {
  final String vehicleType;
  final String category;

  const ManufacturerScreen({super.key, required this.vehicleType, required this.category});

  @override
  State<ManufacturerScreen> createState() => _ManufacturerScreenState();
}

class _ManufacturerScreenState extends State<ManufacturerScreen> {
  final List<String> _allManufacturers = [
    'HERO MOTORS',
    'HONDA',
    'KINETIC ENGINEERING',
    'MAHINDRA',
    'Ola Electric',
    'PIAGGIO',
    'REVOLT',
    'SUZUKI',
    'TVS MOTORS',
    'YAMAHA',
  ];

  List<String> _filteredManufacturers = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredManufacturers = _allManufacturers;
  }

  void _filterManufacturers(String query) {
    setState(() {
      _filteredManufacturers = _allManufacturers
          .where((m) => m.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
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
              '${widget.vehicleType} » ${widget.category.toUpperCase()}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterManufacturers,
              decoration: InputDecoration(
                hintText: 'Search by Manufacturer',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _filterManufacturers('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
          Expanded(
            child: _filteredManufacturers.isEmpty
                ? const Center(child: Text('No manufacturers found'))
                : ListView.separated(
                    itemCount: _filteredManufacturers.length,
                    separatorBuilder: (context, index) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          _filteredManufacturers[index],
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductListScreen(
                                manufacturer: _filteredManufacturers[index],
                                vehicleType: widget.vehicleType,
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
}
