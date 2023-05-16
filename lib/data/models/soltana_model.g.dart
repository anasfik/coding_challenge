// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soltana_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SoltanaPostAdapter extends TypeAdapter<SoltanaPost> {
  @override
  final int typeId = 1;

  @override
  SoltanaPost read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SoltanaPost(
      title: fields[0] as String,
      content: fields[1] as String,
      imagePath: fields[2] as String,
      category: fields[3] as String?,
      date: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, SoltanaPost obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.imagePath)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SoltanaPostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
