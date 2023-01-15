// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BooksAdapter extends TypeAdapter<Books> {
  @override
  final int typeId = 1;

  @override
  Books read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Books(
      id: fields[0] as int?,
      book_title: fields[1] as String?,
      book_author: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Books obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.book_title)
      ..writeByte(2)
      ..write(obj.book_author);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BooksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
