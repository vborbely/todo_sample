import 'package:flutter_bloc/flutter_bloc.dart';

import '../data.dart';

class SettingsCubit extends Cubit<SettingsCubitState> {
  final SettingsRepository _settingsRepository;

  SettingsCubit({required SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository,
        super(const SettingsCubitState.init());

  void toggleSetting(Settings setting) {
    emit(const SettingsCubitState.loading());
    _settingsRepository.setSettings(setting.copyWith(value: !setting.value));
    emit(SettingsCubitState.loaded(settings: _settingsRepository.settings));
  }

  void init() {
    _settingsRepository.init();
    emit(SettingsCubitState.loaded(settings: _settingsRepository.settings));
  }
}
