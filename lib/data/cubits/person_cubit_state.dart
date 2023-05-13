import 'package:freezed_annotation/freezed_annotation.dart';

import '../data.dart';

part 'person_cubit_state.freezed.dart';

@freezed
class PersonCubitState {
  const factory PersonCubitState.init() = _InitState;

  const factory PersonCubitState.loading() = _LoadingState;

  const factory PersonCubitState.loaded(Person person) = _LoadedState;
}
