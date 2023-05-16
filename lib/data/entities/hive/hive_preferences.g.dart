// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_preferences.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveBaseObjAdapter extends TypeAdapter<HiveBaseObj> {
  @override
  final int typeId = 0;

  @override
  HiveBaseObj read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveBaseObj(
      fields[0] as String,
      fields[2] as PreferencesType,
      fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, HiveBaseObj obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.keyName)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveBaseObjAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HivePreferencesAdapter extends TypeAdapter<HivePreferences> {
  @override
  final int typeId = 1;

  @override
  HivePreferences read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HivePreferences(
      keyName: fields[0] as String,
      createdAt: fields[1] as DateTime,
      type: fields[2] as PreferencesType,
      value: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HivePreferences obj) {
    writer
      ..writeByte(4)
      ..writeByte(11)
      ..write(obj.value)
      ..writeByte(0)
      ..write(obj.keyName)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HivePreferencesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PreferencesTypeAdapter extends TypeAdapter<PreferencesType> {
  @override
  final int typeId = 2;

  @override
  PreferencesType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 21:
        return PreferencesType.int;
      case 22:
        return PreferencesType.double;
      case 23:
        return PreferencesType.bool;
      case 24:
        return PreferencesType.string;
      default:
        return PreferencesType.int;
    }
  }

  @override
  void write(BinaryWriter writer, PreferencesType obj) {
    switch (obj) {
      case PreferencesType.int:
        writer.writeByte(21);
        break;
      case PreferencesType.double:
        writer.writeByte(22);
        break;
      case PreferencesType.bool:
        writer.writeByte(23);
        break;
      case PreferencesType.string:
        writer.writeByte(24);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PreferencesTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
