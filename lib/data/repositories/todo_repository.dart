import '../data.dart';

class TodoRepository {
  TodoRepository() {
    init();
  }

  final List<Todo> _todos = [];
  final List<TodoAssigned> _todosAssigned = [];

  List<Todo> get todos => _todos;

  void init() {
    _todos.addAll([
      Todo(
          id: 1,
          title: "Clean the garage",
          created: DateTime.parse('2023-03-01 10:52:00')),
      Todo(
          id: 2,
          title: "Do the shopping",
          description: "- eggs\n- milk\n- pencil",
          created: DateTime.parse('2023-03-01 10:52:00')),
    ]);

    _todosAssigned.addAll([
      TodoAssigned(
        assignedTo: const Person(
          id: 1,
          name: "John Doe",
          email: "j.doe@example.com",
        ),
        status: TodoStatus.assigned,
        assigned: DateTime.parse('2023-03-02 08:12:00'),
        todo: Todo(
            id: 3,
            title: "Bring the children!!!",
            description: "- @13:45 school\n- @16:00 football",
            created: DateTime.parse('2023-03-01 10:52:00')),
      ),
    ]);
  }

  Todo addTodo(Todo todo) {
    final Todo? newTodo;
    // if (todo.id == 0) {
    //   newTodo = Todo(id: _todos.length + 1, name: todo.name, age: todo.age);
    // } else {
    //   newTodo = todo;
    // }
    // _todos.add(newTodo);
    return todo;
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
  }

  void loadTodos() {
    _todos.clear();
    init();
  }
}
