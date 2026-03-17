import 'package:flutter/material.dart';
import '../../data/models/product_model.dart';
import '../../data/models/category_model.dart';
import '../../data/models/vehicle_model.dart';
import '../../services/hive_service.dart';

class CatalogProvider with ChangeNotifier {
  final HiveService _hiveService;

  CatalogProvider(this._hiveService);

  List<ProductModel> _products = [];
  List<CategoryModel> _categories = [];
  List<VehicleModel> _vehicles = [];

  List<ProductModel> get products => _products;
  List<CategoryModel> get categories => _categories;
  List<VehicleModel> get vehicles => _vehicles;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadInitialData() async {
    _isLoading = true;
    notifyListeners();

    _products = _hiveService.getAllProducts();
    _categories = _hiveService.categoryBox.values.toList();
    _vehicles = _hiveService.vehicleBox.values.toList();

    // Mock Categories
    if (_categories.isEmpty) {
      _categories = [
        CategoryModel(id: '1', name: 'Belts', imageUrl: 'assets/images/belts.png'),
        CategoryModel(id: '2', name: 'Oil Seals', imageUrl: 'assets/images/oil_seals.png'),
        CategoryModel(id: '3', name: 'New Auto Products', imageUrl: 'assets/images/new_products.png'),
      ];
      await _hiveService.categoryBox.addAll(_categories);
    }

    // Mock Vehicles
    if (_vehicles.isEmpty) {
      _vehicles = [
        VehicleModel(id: '1', name: '2 WHEELER', iconPath: 'assets/images/2_wheeler.png'),
        VehicleModel(id: '2', name: '3 WHEELER', iconPath: 'assets/images/3_wheeler.png'),
        VehicleModel(id: '3', name: 'CAR', iconPath: 'assets/images/car.png'),
        VehicleModel(id: '4', name: 'Heavy Commercial Vehicle', iconPath: 'assets/images/heavy_vehicle.png'),
        VehicleModel(id: '5', name: 'Light Commercial Vehicle', iconPath: 'assets/images/light_vehicle.png'),
        VehicleModel(id: '6', name: 'TRACTORS', iconPath: 'assets/images/tractor.png'),
        VehicleModel(id: '7', name: 'Others', iconPath: 'assets/images/others.png'),
      ];
      await _hiveService.vehicleBox.addAll(_vehicles);
    }

    // Mock Products
    if (_products.isEmpty) {
      _products = [
        ProductModel(
          name: 'Dynamo Belt',
          application: 'Honda Activa',
          partNo: 'WTE416',
          referenceNo: 'A-13H9384/830',
          price: 220.0,
          type: 'Fenner - Wrapped',
          category: 'Belts',
          manufacturer: 'HONDA',
          vehicleType: '2 WHEELER',
        ),
        ProductModel(
          name: 'Fan Belt',
          application: 'Honda Shine',
          partNo: 'FKS528',
          referenceNo: 'A-B1J6280/850',
          price: 257.0,
          type: 'Fenner - Wrapped',
          category: 'Belts',
          manufacturer: 'HONDA',
          vehicleType: '2 WHEELER',
        ),
        ProductModel(
          name: 'Oil Seal Front Wheel',
          application: 'Hero Splendor',
          partNo: 'OS101',
          referenceNo: 'H-91251-KPH-901',
          price: 45.0,
          type: 'Nitril Rubber',
          category: 'Oil Seals',
          manufacturer: 'HERO MOTORS',
          vehicleType: '2 WHEELER',
          innerDiameter: 12.0,
          outerDiameter: 21.0,
          thickness: 4.0,
        ),
      ];
      await _hiveService.addProducts(_products);
    }

    _isLoading = false;
    notifyListeners();
  }

  List<ProductModel> searchProducts(String query) {
    if (query.isEmpty) return [];
    return _products.where((p) =>
      p.name.toLowerCase().contains(query.toLowerCase()) ||
      p.partNo.toLowerCase().contains(query.toLowerCase()) ||
      p.application.toLowerCase().contains(query.toLowerCase()) ||
      (p.referenceNo.toLowerCase().contains(query.toLowerCase()))
    ).toList();
  }
}
