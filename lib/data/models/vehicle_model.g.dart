// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VehicleModelAdapter extends TypeAdapter<VehicleModel> {
  @override
  final int typeId = 2;

  @override
  VehicleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VehicleModel(
      id: fields[0] as String,
      name: fields[1] as String,
      iconPath: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VehicleModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.iconPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehicleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
