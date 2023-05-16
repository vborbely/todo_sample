import 'package:bloc_sample/application/errors/error.dart' as E;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'storage_cubit_state.freezed.dart';

@freezed
class StorageCubitState with _$StorageCubitState {
  const factory StorageCubitState.init() = StorageCubitInitState;

  const factory StorageCubitState.initialized(List<String> boxNames) =
      StorageCubitInitializedState;

  const factory StorageCubitState.error(E.Error error) = StorageCubitErrorState;
}
