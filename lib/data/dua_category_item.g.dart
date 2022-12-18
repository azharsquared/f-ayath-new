// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dua_category_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DuaCatergoryItemAdapter extends TypeAdapter<DuaCatergoryItem> {
  @override
  final int typeId = 0;

  @override
  DuaCatergoryItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DuaCatergoryItem(
      id: fields[0] as int?,
      name: fields[1] as String,
      duaNameList: (fields[7] as List).cast<DuaNameItem>(),
      isFavourite: fields[4] as bool,
      time: fields[2] as int?,
      totalDua: fields[3] as int?,
      isDone: fields[5] as bool,
      createdAt: fields[6] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, DuaCatergoryItem obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.totalDua)
      ..writeByte(4)
      ..write(obj.isFavourite)
      ..writeByte(5)
      ..write(obj.isDone)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.duaNameList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DuaCatergoryItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
