// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 0;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      name: fields[0] as String,
      application: fields[1] as String,
      partNo: fields[2] as String,
      referenceNo: fields[3] as String,
      price: fields[4] as double,
      type: fields[5] as String,
      innerDiameter: fields[6] as double?,
      outerDiameter: fields[7] as double?,
      thickness: fields[8] as double?,
      category: fields[9] as String,
      manufacturer: fields[10] as String,
      vehicleType: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.application)
      ..writeByte(2)
      ..write(obj.partNo)
      ..writeByte(3)
      ..write(obj.referenceNo)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.innerDiameter)
      ..writeByte(7)
      ..write(obj.outerDiameter)
      ..writeByte(8)
      ..write(obj.thickness)
      ..writeByte(9)
      ..write(obj.category)
      ..writeByte(10)
      ..write(obj.manufacturer)
      ..writeByte(11)
      ..write(obj.vehicleType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
