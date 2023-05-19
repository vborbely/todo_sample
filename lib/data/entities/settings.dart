import 'package:freezed_annotation/freezed_annotation.dart';

class Settings {
  final String label;
  final String? description;
  final SettingsKey name;
  final dynamic value;
  final dynamic defaultValue;
  final SettingsType type;

  Settings({
    required this.label,
    @Default(null) this.description,
    required this.value,
    required this.defaultValue,
    required this.name,
    this.type = SettingsType.string,
  });

  Settings copyWith({
    String? label,
    String? description,
    SettingsKey? name,
    dynamic value,
    dynamic defaultValue,
    SettingsType? type,
  }) {
    return Settings(
      label: label ?? this.label,
      description: description ?? this.description,
      name: name ?? this.name,
      value: value ?? this.value,
      defaultValue: defaultValue ?? this.defaultValue,
      type: type ?? this.type,
    );
  }
}

extension SettingsExt on Settings {
  dynamic get asValue => type == SettingsType.bool
      ? value as bool
      : type == SettingsType.double
      ? value as double
      : type == SettingsType.int
      ? value as int
      : type == SettingsType.string
      ? value as String
      : value as String;
}

enum SettingsKey {
  darkMode,
}

enum SettingsType {
  int,
  double,
  bool,
  string,
}
