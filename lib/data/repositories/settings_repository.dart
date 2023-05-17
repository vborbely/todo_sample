import '../../application/application.dart';
import '../data.dart';

class SettingsRepository {
  final StorageService _storageService;

  SettingsRepository({required StorageService storageCubit})
      : _storageService = storageCubit;

  final Map<SettingsKey, Settings> _settings = {};

  Map<SettingsKey, Settings> get settings => _settings;

  Future<void> init() async {
    // load from StorageCubit
    logger.d('SettingsRepository.init');
    await _loadAll();
    await _subscription();
  }

  void setSettings(Settings newValue) {
    final type = PreferencesType.values.firstWhere(
        (pt) => pt.name == newValue.type.name,
        orElse: () => PreferencesType.string);
    _storageService.writePreferences(HivePreferences(
      createdAt: DateTime.now(),
      keyName: newValue.name.name,
      value: newValue.value.toString(),
      type: type,
    ));
  }

  Future<void> _subscription() async {
    _storageService.boxStream(StorageType.preferences).listen((update) {
      final key = SettingsKey.values.firstWhere((k) => k.name == update.key);

      final pref = update.value as HivePreferences;
      final setting = _settings[key];
      if (setting != null) {
        _settings[key] = setting.copyWith(value: pref.asValue);
      }
    });
  }

  Future<void> _loadAll() async {
    _settings.clear();
    _settings.addAll(getDefaults());
    for (final key in SettingsKey.values) {
      final settings = _settings[key];
      final fromPref = _storageService.readPreferences(key.name);
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
