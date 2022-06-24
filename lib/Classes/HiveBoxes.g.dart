// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HiveBoxes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventsBoxAdapter extends TypeAdapter<EventsBox> {
  @override
  final int typeId = 0;

  @override
  EventsBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventsBox(
      date: fields[0] as DateTime,
      eventsList: (fields[1] as List).cast<CleanCalendarEvent>(),
    );
  }

  @override
  void write(BinaryWriter writer, EventsBox obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.eventsList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventsBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
