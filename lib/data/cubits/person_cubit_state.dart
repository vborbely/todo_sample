import 'package:bloc_sample/application/errors/error.dart' as E;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data.dart';

part 'person_cubit_state.freezed.dart';

@freezed
class PersonCubitState with _$PersonCubitState {
  const factory PersonCubitState.init() = InitState;

  const factory PersonCubitState.loading() = LoadingState;

  const factory PersonCubitState.loaded(
      {@Default(<Person>[]) List<Person> persons,
      @Default(null) Person? selected}) = LoadedState;

  const factory PersonCubitState.error(E.Error error) = ErrorState;
}
