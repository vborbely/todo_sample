import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_sample/application/errors/error.dart';

import '../data.dart';

part 'todo_cubit_state.freezed.dart';

@freezed
class TodoCubitState with _$TodoCubitState {
  const factory TodoCubitState.init() = TodoCubitInitState;

  const factory TodoCubitState.loading() = TodoCubitLoadingState;

  const factory TodoCubitState.loaded({
    @Default(<Todo>[]) List<Todo> todos,
    @Default(null) Todo? selected,
  }) = TodoCubitLoadedState;

  const factory TodoCubitState.error(TodoError error) = TodoCubitErrorState;
}
