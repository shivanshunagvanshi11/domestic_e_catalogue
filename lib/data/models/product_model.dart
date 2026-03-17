import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String application;
  @HiveField(2)
  final String partNo;
  @HiveField(3)
  final String referenceNo;
  @HiveField(4)
  final double price;
  @HiveField(5)
  final String type;
  @HiveField(6)
  final double? innerDiameter;
  @HiveField(7)
  final double? outerDiameter;
  @HiveField(8)
  final double? thickness;
  @HiveField(9)
  final String category;
  @HiveField(10)
  final String manufacturer;
  @HiveField(11)
  final String vehicleType;

  ProductModel({
    required this.name,
    required this.application,
    required this.partNo,
    required this.referenceNo,
    required this.price,
    required this.type,
    this.innerDiameter,
    this.outerDiameter,
    this.thickness,
    required this.category,
    required this.manufacturer,
    required this.vehicleType,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'] ?? '',
      application: json['application'] ?? '',
      partNo: json['part_no'] ?? '',
      referenceNo: json['reference_no'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      type: json['type'] ?? '',
      innerDiameter: json['inner_diameter']?.toDouble(),
      outerDiameter: json['outer_diameter']?.toDouble(),
      thickness: json['thickness']?.toDouble(),
      category: json['category'] ?? '',
      manufacturer: json['manufacturer'] ?? '',
      vehicleType: json['vehicle_type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'application': application,
      'part_no': partNo,
      'reference_no': referenceNo,
      'price': price,
      'type': type,
      'inner_diameter': innerDiameter,
      'outer_diameter': outerDiameter,
      'thickness': thickness,
      'category': category,
      'manufacturer': manufacturer,
      'vehicle_type': vehicleType,
    };
  }
}
