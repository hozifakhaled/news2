// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArticalesModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticalesModelAdapter extends TypeAdapter<ArticalesModel> {
  @override
  final int typeId = 0;

  @override
  ArticalesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticalesModel(
      title: fields[0] as String,
      image: fields[1] as String,
      url: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ArticalesModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticalesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
