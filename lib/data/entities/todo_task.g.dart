// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoTask _$$_TodoTaskFromJson(Map<String, dynamic> json) => _$_TodoTask(
      id: json['id'] as int,
      description: json['description'] as String? ?? null,
      icon: json['icon'] as String? ?? null,
      completed: json['completed'] as bool? ?? null,
    );

Map<String, dynamic> _$$_TodoTaskToJson(_$_TodoTask instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'icon': instance.icon,
      'completed': instance.completed,
    };
