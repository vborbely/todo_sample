// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoTask _$TodoTaskFromJson(Map<String, dynamic> json) {
  return _TodoTask.fromJson(json);
}

/// @nodoc
mixin _$TodoTask {
  int get id => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  bool? get completed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoTaskCopyWith<TodoTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoTaskCopyWith<$Res> {
  factory $TodoTaskCopyWith(TodoTask value, $Res Function(TodoTask) then) =
      _$TodoTaskCopyWithImpl<$Res, TodoTask>;
  @useResult
  $Res call({int id, String? description, String? icon, bool? completed});
}

/// @nodoc
class _$TodoTaskCopyWithImpl<$Res, $Val extends TodoTask>
    implements $TodoTaskCopyWith<$Res> {
  _$TodoTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = freezed,
    Object? icon = freezed,
    Object? completed = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoTaskCopyWith<$Res> implements $TodoTaskCopyWith<$Res> {
  factory _$$_TodoTaskCopyWith(
          _$_TodoTask value, $Res Function(_$_TodoTask) then) =
      __$$_TodoTaskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? description, String? icon, bool? completed});
}

/// @nodoc
class __$$_TodoTaskCopyWithImpl<$Res>
    extends _$TodoTaskCopyWithImpl<$Res, _$_TodoTask>
    implements _$$_TodoTaskCopyWith<$Res> {
  __$$_TodoTaskCopyWithImpl(
      _$_TodoTask _value, $Res Function(_$_TodoTask) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = freezed,
    Object? icon = freezed,
    Object? completed = freezed,
  }) {
    return _then(_$_TodoTask(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodoTask extends _TodoTask {
  const _$_TodoTask(
      {required this.id,
      this.description = null,
      this.icon = null,
      this.completed = null})
      : super._();

  factory _$_TodoTask.fromJson(Map<String, dynamic> json) =>
      _$$_TodoTaskFromJson(json);

  @override
  final int id;
  @override
  @JsonKey()
  final String? description;
  @override
  @JsonKey()
  final String? icon;
  @override
  @JsonKey()
  final bool? completed;

  @override
  String toString() {
    return 'TodoTask(id: $id, description: $description, icon: $icon, completed: $completed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoTask &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, description, icon, completed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoTaskCopyWith<_$_TodoTask> get copyWith =>
      __$$_TodoTaskCopyWithImpl<_$_TodoTask>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoTaskToJson(
      this,
    );
  }
}

abstract class _TodoTask extends TodoTask {
  const factory _TodoTask(
      {required final int id,
      final String? description,
      final String? icon,
      final bool? completed}) = _$_TodoTask;
  const _TodoTask._() : super._();

  factory _TodoTask.fromJson(Map<String, dynamic> json) = _$_TodoTask.fromJson;

  @override
  int get id;
  @override
  String? get description;
  @override
  String? get icon;
  @override
  bool? get completed;
  @override
  @JsonKey(ignore: true)
  _$$_TodoTaskCopyWith<_$_TodoTask> get copyWith =>
      throw _privateConstructorUsedError;
}
