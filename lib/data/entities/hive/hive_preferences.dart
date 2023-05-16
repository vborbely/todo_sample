import 'package:hive/hive.dart';

part 'hive_preferences.g.dart';

@HiveType(typeId: 0)
class HiveBaseObj extends HiveObject {
  @HiveField(0)
  final String keyName;
  @HiveField(1)
  final DateTime createdAt;
  @HiveField(2)
  final PreferencesType type;

  HiveBaseObj(this.keyName, this.type, this.createdAt);
}

@HiveType(typeId: 1)
class HivePreferences extends HiveBaseObj {
  @HiveField(11)
  final String value;

  HivePreferences({
    required String keyName,
    required DateTime createdAt,
    required PreferencesType type,
    required this.value,
  }) : super(keyName, type, createdAt);

  @override
  String toString() {
    return 'HiveEntry{key: $keyName, value: $value, type: $type, createdAt: $createdAt}';
  }
}

@HiveType(typeId: 2)
enum PreferencesType {
  @HiveField(21)
  int,
  @HiveField(22)
  double,
  @HiveField(23)
  bool,
  @HiveField(24)
  string,
}

extension HivePreferencesExt on HivePreferences {
  dynamic get asValue => type == PreferencesType.bool
      ? value == 'true'
      : type == PreferencesType.double
          ? double.tryParse(value) ?? 0.0
          : type == PreferencesType.int
              ? int.tryParse(value) ?? 0
              : type == PreferencesType.string
                  ? value
                  : value;
}
