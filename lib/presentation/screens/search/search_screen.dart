import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/catalog_provider.dart';
import '../../widgets/product_card.dart';
import '../product_detail/product_detail_screen.dart';
import '../../../core/constants/app_colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CatalogProvider>(context);
    final results = provider.searchProducts(_query);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Search by Part No, Vehicle, or Dimension...',
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              _query = value;
            });
          },
        ),
        actions: [
          if (_query.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _searchController.clear();
                setState(() {
                  _query = '';
                });
              },
            ),
        ],
      ),
      body: _query.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search, size: 80, color: Colors.grey[300]),
                  const SizedBox(height: 16),
                  const Text(
                    'Search for products by part number,\nvehicle name or dimensions.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
          : results.isEmpty
              ? const Center(child: Text('No products found matching your search.'))
              : ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final product = results[index];
                    return ProductCard(
                      product: product,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailScreen(product: product),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }
}
