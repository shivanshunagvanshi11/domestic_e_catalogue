import 'package:hive/hive.dart';

part 'vehicle_model.g.dart';

@HiveType(typeId: 2)
class VehicleModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String iconPath;

  VehicleModel({
    required this.id,
    required this.name,
    required this.iconPath,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      iconPath: json['icon_path'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon_path': iconPath,
    };
  }
}
