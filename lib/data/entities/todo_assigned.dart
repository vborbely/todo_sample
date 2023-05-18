import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_sample/data/data.dart';

part 'todo_assigned.freezed.dart';
part 'todo_assigned.g.dart';

@freezed
class TodoAssigned with _$TodoAssigned {
  const TodoAssigned._();

  const factory TodoAssigned({
    required Todo todo,
    required TodoStatus status,
    required Person assignedTo,
    @Default(null) DateTime? expireDate,
    required DateTime assigned,
    @Default(null) DateTime? completed,
  }) = _TodoAssigned;

  factory TodoAssigned.fromJson(Map<String, dynamic> json) =>
      _$TodoAssignedFromJson(json);
}

enum TodoStatus {
  @JsonValue('assigned')
  assigned,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('completed')
  completed,
  @JsonValue('expired')
  expired,
  @JsonValue('cancelled')
  cancelled,
}
