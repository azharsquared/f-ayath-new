// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dua_name_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DuaNameItemAdapter extends TypeAdapter<DuaNameItem> {
  @override
  final int typeId = 1;

  @override
  DuaNameItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DuaNameItem(
      id: fields[0] as int?,
      name: fields[1] as String,
      duaList: (fields[8] as List).cast<DuaItem>(),
      isFavourite: fields[3] as bool,
      time: fields[2] as int?,
      userCount: fields[6] as int?,
      count: fields[5] as int?,
      isDone: fields[4] as bool,
      createdAt: fields[7] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, DuaNameItem obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.isFavourite)
      ..writeByte(4)
      ..write(obj.isDone)
      ..writeByte(5)
      ..write(obj.count)
      ..writeByte(6)
      ..write(obj.userCount)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.duaList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DuaNameItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
