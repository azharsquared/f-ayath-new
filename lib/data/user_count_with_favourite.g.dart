// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_count_with_favourite.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserCountWithFavouriteAdapter
    extends TypeAdapter<UserCountWithFavourite> {
  @override
  final int typeId = 3;

  @override
  UserCountWithFavourite read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserCountWithFavourite(
      id: fields[0] as int?,
      duaId: fields[1] as int,
      userCount: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UserCountWithFavourite obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.duaId)
      ..writeByte(2)
      ..write(obj.userCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCountWithFavouriteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
