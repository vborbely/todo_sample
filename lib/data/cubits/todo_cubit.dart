import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/application.dart';
import '../data.dart';

class TodoCubit extends Cubit<TodoCubitState> {
  final TodoRepository _todoRepository;

  Todo? _person;

  set _selectTodo(Todo person) {
    emit(const TodoCubitState.loading());
    _person = person;
    emit(
        TodoCubitState.loaded(todos: _todoRepository.todos, selected: _person));
  }

  List<Todo> get persons => _todoRepository.todos;

  Todo? get selected => _person;

  TodoCubit({required TodoRepository todoRepository})
      : _todoRepository = todoRepository,
        super(const TodoCubitState.init());

  void loadTodos() {
    logger.d('TodoCubit.loadTodos');
    emit(const TodoCubitState.loading());
    _todoRepository.loadTodos();
    emit(
        TodoCubitState.loaded(todos: _todoRepository.todos, selected: _person));
  }

  Todo addTodo(Todo person) {
    emit(const TodoCubitState.loading());
    final newTodo = _todoRepository.addTodo(person);
    emit(
        TodoCubitState.loaded(todos: _todoRepository.todos, selected: _person));
    return newTodo;
  }

  void deleteTodo(Todo person) {
    emit(const TodoCubitState.loading());
    _todoRepository.removeTodo(person);
    emit(
        TodoCubitState.loaded(todos: _todoRepository.todos, selected: _person));
  }

  void selectTodo(Todo todo) {
    _selectTodo = todo;
  }
}
