import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_sample/application/errors/error.dart' as E;
import 'package:todo_sample/data/data.dart';

part 'settings_cubit_state.freezed.dart';

@freezed
class SettingsCubitState with _$SettingsCubitState {
  const factory SettingsCubitState.init() = SettingsCubitInitState;

  const factory SettingsCubitState.loading() = SettingsCubitLoadingState;

  const factory SettingsCubitState.loaded(
      {@Default(<SettingsKey, Settings>{})
          Map<SettingsKey, Settings> settings}) = SettingsCubitLoadedState;

  const factory SettingsCubitState.error(E.Error error) =
      SettingsCubitErrorState;
}
