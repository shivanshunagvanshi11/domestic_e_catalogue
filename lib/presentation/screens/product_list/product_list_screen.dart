import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/catalog_provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../widgets/product_card.dart';
import '../product_detail/product_detail_screen.dart';

class ProductListScreen extends StatelessWidget {
  final String manufacturer;
  final String vehicleType;

  const ProductListScreen({
    super.key,
    required this.manufacturer,
    required this.vehicleType,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CatalogProvider>(context);
    // For demo purposes, we filter from all products
    // In a real app, this logic might be in the provider or a use case
    final products = provider.products.where((p) => 
      p.manufacturer == manufacturer && p.vehicleType == vehicleType
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$vehicleType » BELTS » $manufacturer'),
      ),
      body: products.isEmpty 
        ? const Center(child: Text('No products found.'))
        : ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
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
