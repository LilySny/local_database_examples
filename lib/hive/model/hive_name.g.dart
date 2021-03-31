// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_name.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveNameAdapter extends TypeAdapter<HiveName> {
  @override
  final int typeId = 0;

  @override
  HiveName read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveName(
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveName obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveNameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
