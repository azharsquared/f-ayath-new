// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dua_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DuaItemAdapter extends TypeAdapter<DuaItem> {
  @override
  final int typeId = 2;

  @override
  DuaItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DuaItem(
      id: fields[0] as int?,
      arabic: fields[1] as String,
      translation: fields[2] as String,
      count: fields[4] as int?,
      createdAt: fields[3] as DateTime?,
      updatedAt: fields[6] as DateTime?,
    )..userCount = fields[5] as int?;
  }

  @override
  void write(BinaryWriter writer, DuaItem obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.arabic)
      ..writeByte(2)
      ..write(obj.translation)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.count)
      ..writeByte(5)
      ..write(obj.userCount)
      ..writeByte(6)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DuaItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
