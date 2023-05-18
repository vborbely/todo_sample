import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_task.freezed.dart';
part 'todo_task.g.dart';

@freezed
class TodoTask with _$TodoTask {
  const TodoTask._();

  const factory TodoTask({
    required int id,
    @Default(null) String? description,
    @Default(null) String? icon,
    @Default(null) bool? completed,
  }) = _TodoTask;

  factory TodoTask.fromJson(Map<String, dynamic> json) =>
      _$TodoTaskFromJson(json);
}
