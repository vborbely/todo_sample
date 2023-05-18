import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_sample/application/errors/error.dart' as E;

import '../data.dart';

part 'person_cubit_state.freezed.dart';

@freezed
class PersonCubitState with _$PersonCubitState {
  const factory PersonCubitState.init() = PersonCubitInitState;

  const factory PersonCubitState.loading() = PersonCubitLoadingState;

  const factory PersonCubitState.loaded(
      {@Default(<Person>[]) List<Person> persons,
      @Default(null) Person? selected}) = PersonCubitLoadedState;

  const factory PersonCubitState.error(E.Error error) = PersonCubitErrorState;
}
