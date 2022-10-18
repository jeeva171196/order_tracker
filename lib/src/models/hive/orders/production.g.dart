// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductionAdapter extends TypeAdapter<Production> {
  @override
  final int typeId = 3;

  @override
  Production read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Production(
      productionId: fields[0] as int,
      steps: (fields[2] as List).cast<ProductionStep>(),
      timeStamp: fields[1] as DateTime,
      bundles: (fields[3] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, Production obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.productionId)
      ..writeByte(1)
      ..write(obj.timeStamp)
      ..writeByte(2)
      ..write(obj.steps)
      ..writeByte(3)
      ..write(obj.bundles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
