// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todo _$$_TodoFromJson(Map<String, dynamic> json) => _$_Todo(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String? ?? null,
      icon: json['icon'] as String? ?? null,
      tasks: (json['tasks'] as List<dynamic>?)
              ?.map((e) => TodoTask.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      created: DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$$_TodoToJson(_$_Todo instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'icon': instance.icon,
      'tasks': instance.tasks,
      'created': instance.created.toIso8601String(),
    };
