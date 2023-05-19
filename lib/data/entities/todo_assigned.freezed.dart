// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_assigned.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoAssigned _$TodoAssignedFromJson(Map<String, dynamic> json) {
  return _TodoAssigned.fromJson(json);
}

/// @nodoc
mixin _$TodoAssigned {
  Todo get todo => throw _privateConstructorUsedError;
  TodoStatus get status => throw _privateConstructorUsedError;
  Person get assignedTo => throw _privateConstructorUsedError;
  DateTime? get expireDate => throw _privateConstructorUsedError;
  DateTime get assigned => throw _privateConstructorUsedError;
  DateTime? get completed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoAssignedCopyWith<TodoAssigned> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoAssignedCopyWith<$Res> {
  factory $TodoAssignedCopyWith(
          TodoAssigned value, $Res Function(TodoAssigned) then) =
      _$TodoAssignedCopyWithImpl<$Res, TodoAssigned>;
  @useResult
  $Res call(
      {Todo todo,
      TodoStatus status,
      Person assignedTo,
      DateTime? expireDate,
      DateTime assigned,
      DateTime? completed});

  $TodoCopyWith<$Res> get todo;
  $PersonCopyWith<$Res> get assignedTo;
}

/// @nodoc
class _$TodoAssignedCopyWithImpl<$Res, $Val extends TodoAssigned>
    implements $TodoAssignedCopyWith<$Res> {
  _$TodoAssignedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todo = null,
    Object? status = null,
    Object? assignedTo = null,
    Object? expireDate = freezed,
    Object? assigned = null,
    Object? completed = freezed,
  }) {
    return _then(_value.copyWith(
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as Todo,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TodoStatus,
      assignedTo: null == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as Person,
      expireDate: freezed == expireDate
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      assigned: null == assigned
          ? _value.assigned
          : assigned // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TodoCopyWith<$Res> get todo {
    return $TodoCopyWith<$Res>(_value.todo, (value) {
      return _then(_value.copyWith(todo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PersonCopyWith<$Res> get assignedTo {
    return $PersonCopyWith<$Res>(_value.assignedTo, (value) {
      return _then(_value.copyWith(assignedTo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TodoAssignedCopyWith<$Res>
    implements $TodoAssignedCopyWith<$Res> {
  factory _$$_TodoAssignedCopyWith(
          _$_TodoAssigned value, $Res Function(_$_TodoAssigned) then) =
      __$$_TodoAssignedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Todo todo,
      TodoStatus status,
      Person assignedTo,
      DateTime? expireDate,
      DateTime assigned,
      DateTime? completed});

  @override
  $TodoCopyWith<$Res> get todo;
  @override
  $PersonCopyWith<$Res> get assignedTo;
}

/// @nodoc
class __$$_TodoAssignedCopyWithImpl<$Res>
    extends _$TodoAssignedCopyWithImpl<$Res, _$_TodoAssigned>
    implements _$$_TodoAssignedCopyWith<$Res> {
  __$$_TodoAssignedCopyWithImpl(
      _$_TodoAssigned _value, $Res Function(_$_TodoAssigned) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todo = null,
    Object? status = null,
    Object? assignedTo = null,
    Object? expireDate = freezed,
    Object? assigned = null,
    Object? completed = freezed,
  }) {
    return _then(_$_TodoAssigned(
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as Todo,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TodoStatus,
      assignedTo: null == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as Person,
      expireDate: freezed == expireDate
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      assigned: null == assigned
          ? _value.assigned
          : assigned // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodoAssigned extends _TodoAssigned {
  const _$_TodoAssigned(
      {required this.todo,
      required this.status,
      required this.assignedTo,
      this.expireDate = null,
      required this.assigned,
      this.completed = null})
      : super._();

  factory _$_TodoAssigned.fromJson(Map<String, dynamic> json) =>
      _$$_TodoAssignedFromJson(json);

  @override
  final Todo todo;
  @override
  final TodoStatus status;
  @override
  final Person assignedTo;
  @override
  @JsonKey()
  final DateTime? expireDate;
  @override
  final DateTime assigned;
  @override
  @JsonKey()
  final DateTime? completed;

  @override
  String toString() {
    return 'TodoAssigned(todo: $todo, status: $status, assignedTo: $assignedTo, expireDate: $expireDate, assigned: $assigned, completed: $completed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoAssigned &&
            (identical(other.todo, todo) || other.todo == todo) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.expireDate, expireDate) ||
                other.expireDate == expireDate) &&
            (identical(other.assigned, assigned) ||
                other.assigned == assigned) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, todo, status, assignedTo, expireDate, assigned, completed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoAssignedCopyWith<_$_TodoAssigned> get copyWith =>
      __$$_TodoAssignedCopyWithImpl<_$_TodoAssigned>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoAssignedToJson(
      this,
    );
  }
}

abstract class _TodoAssigned extends TodoAssigned {
  const factory _TodoAssigned(
      {required final Todo todo,
      required final TodoStatus status,
      required final Person assignedTo,
      final DateTime? expireDate,
      required final DateTime assigned,
      final DateTime? completed}) = _$_TodoAssigned;
  const _TodoAssigned._() : super._();

  factory _TodoAssigned.fromJson(Map<String, dynamic> json) =
      _$_TodoAssigned.fromJson;

  @override
  Todo get todo;
  @override
  TodoStatus get status;
  @override
  Person get assignedTo;
  @override
  DateTime? get expireDate;
  @override
  DateTime get assigned;
  @override
  DateTime? get completed;
  @override
  @JsonKey(ignore: true)
  _$$_TodoAssignedCopyWith<_$_TodoAssigned> get copyWith =>
      throw _privateConstructorUsedError;
}
