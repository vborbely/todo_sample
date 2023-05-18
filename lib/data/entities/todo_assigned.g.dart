// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_assigned.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoAssigned _$$_TodoAssignedFromJson(Map<String, dynamic> json) =>
    _$_TodoAssigned(
      todo: Todo.fromJson(json['todo'] as Map<String, dynamic>),
      status: $enumDecode(_$TodoStatusEnumMap, json['status']),
      assignedTo: Person.fromJson(json['assignedTo'] as Map<String, dynamic>),
      expireDate: json['expireDate'] == null
          ? null
          : DateTime.parse(json['expireDate'] as String) ?? null,
      assigned: DateTime.parse(json['assigned'] as String),
      completed: json['completed'] == null
          ? null
          : DateTime.parse(json['completed'] as String) ?? null,
    );

Map<String, dynamic> _$$_TodoAssignedToJson(_$_TodoAssigned instance) =>
    <String, dynamic>{
      'todo': instance.todo,
      'status': _$TodoStatusEnumMap[instance.status]!,
      'assignedTo': instance.assignedTo,
      'expireDate': instance.expireDate?.toIso8601String(),
      'assigned': instance.assigned.toIso8601String(),
      'completed': instance.completed?.toIso8601String(),
    };

const _$TodoStatusEnumMap = {
  TodoStatus.assigned: 'assigned',
  TodoStatus.inProgress: 'in_progress',
  TodoStatus.completed: 'completed',
  TodoStatus.expired: 'expired',
  TodoStatus.cancelled: 'cancelled',
};
