import 'package:hive_flutter/hive_flutter.dart';
import '../data/models/product_model.dart';
import '../data/models/category_model.dart';
import '../data/models/vehicle_model.dart';

class HiveService {
  static const String productBoxName = 'products';
  static const String categoryBoxName = 'categories';
  static const String vehicleBoxName = 'vehicles';

  Future<void> init() async {
    await Hive.initFlutter();
    
    // Register Adapters
    Hive.registerAdapter(ProductModelAdapter());
    Hive.registerAdapter(CategoryModelAdapter());
    Hive.registerAdapter(VehicleModelAdapter());

    // Open Boxes
    await Hive.openBox<ProductModel>(productBoxName);
    await Hive.openBox<CategoryModel>(categoryBoxName);
    await Hive.openBox<VehicleModel>(vehicleBoxName);
  }

  Box<ProductModel> get productBox => Hive.box<ProductModel>(productBoxName);
  Box<CategoryModel> get categoryBox => Hive.box<CategoryModel>(categoryBoxName);
  Box<VehicleModel> get vehicleBox => Hive.box<VehicleModel>(vehicleBoxName);

  Future<void> addProducts(List<ProductModel> products) async {
    await productBox.clear();
    await productBox.addAll(products);
  }

  List<ProductModel> getAllProducts() {
    return productBox.values.toList();
  }
}
