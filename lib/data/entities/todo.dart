import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_sample/data/data.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  const Todo._();

  const factory Todo({
    required int id,
    required String title,
    @Default(null) String? description,
    @Default(null) String? icon,
    @Default([]) List<TodoTask> tasks,
    required DateTime created,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
