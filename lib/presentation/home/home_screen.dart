import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_sample/application/application.dart';

import '../../data/data.dart';
import '../presentation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const AppBarColorize(),
        title: const Text(
          'YouDo',
          style: appBarTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push(AppRoute.settings);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      floatingActionButton: const _AddTodoButton(),
      body: const _ScreenBody(child: _TodoList()),
    );
  }
}

class _ScreenBody extends StatelessWidget {
  final Widget child;

  const _ScreenBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _TodoList(),
      ],
    );
  }
}

class _TodoList extends StatelessWidget {
  const _TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final controller = context.watch<TodoCubit>();
    return BlocBuilder<TodoCubit, TodoCubitState>(builder: (context, state) {
      final todos =
          state.maybeWhen(loaded: (todos, _) => todos, orElse: () => <Todo>[]);
      return Container(
        constraints: BoxConstraints(maxWidth: 300, maxHeight: maxHeight),
        // Fix: Material widget needs to prevent the ListView paint outboundaries,
        // due to the underlaying ListTile widget
        child: Material(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    controller.selectTodo(todo);
                    context.push('/todo/${todo.id}');
                  },
                  child: TodoWidget(
                    todo: todo,
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}

class _AddTodoButton extends StatelessWidget {
  const _AddTodoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.watch<TodoCubit>();
    return FloatingActionButton(
      onPressed: () {
        final todo = Todo(
          id: 0,
          title: 'New todo',
          created: DateTime.now(),
        );
        todoCubit.addTodo(todo);
      },
      child: const Icon(Icons.add),
    );
  }
}
