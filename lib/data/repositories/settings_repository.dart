import '../data.dart';

class SettingsRepository {
  final StorageCubit _storageCubit;

  SettingsRepository({required StorageCubit storageCubit})
      : _storageCubit = storageCubit;

  final Map<SettingsKey, Settings> _settings = {};

  Map<SettingsKey, Settings> get settings => _settings;

  Future<void> init() async {
    // load from StorageCubit
    _loadAll();
    _subscription();
  }

  void setSettings(Settings newValue) {
    final type = PreferencesType.values.firstWhere(
        (pt) => pt.name == newValue.type.name,
        orElse: () => PreferencesType.string);
    _storageCubit.writePreferences(HivePreferences(
      createdAt: DateTime.now(),
      keyName: newValue.name.name,
      value: newValue.value.toString(),
      type: type,
    ));
  }

  void _subscription() {
    _storageCubit.boxStream(StorageType.preferences).listen((update) {
      final key = SettingsKey.values.firstWhere((k) => k.name == update.key);

      final pref = update.value as HivePreferences;
      final setting = _settings[key];
      if (setting != null) {
        _settings[key] = setting.copyWith(value: pref.asValue);
      }
    });
  }

  void _loadAll() {
    _settings.clear();
    _settings.addAll(getDefaults());
    for (final key in SettingsKey.values) {
      final settings = _settings[key];
      final fromPref = _storageCubit.readPreferences(key.name);
      if (settings != null && fromPref != null) {
        _settings[key] = settings.copyWith(value: fromPref.asValue);
      }
    }
  }

  Map<SettingsKey, Settings> getDefaults({SettingsKey? key}) {
    final defaults = {
      SettingsKey.darkMode: Settings(
        label: 'Dark Mode',
        name: SettingsKey.darkMode,
        value: false,
        defaultValue: false,
        type: SettingsType.bool,
      ),
    };

    return key != null ? {key: defaults[key]!} : defaults;
  }
}
