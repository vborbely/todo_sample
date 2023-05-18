import '../../data/data.dart';
import '../presentation.dart';

class TodoWidget extends StatelessWidget {
  final Todo? _todo;
  final TodoAssigned? _todoAssigned;
  final bool assigned;

  const TodoWidget({super.key, required dynamic todo})
      : assigned = (todo is TodoAssigned),
        _todoAssigned = todo is TodoAssigned ? todo : null,
        _todo = todo is Todo ? todo : null;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            assigned ? _todoAssigned?.todo.title ?? '' : _todo?.title ?? '',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(assigned
              ? _todoAssigned?.todo.description ?? ''
              : _todo?.description ?? ''),
          // Text(todo.created.toString()),
          Visibility(
              visible: assigned
                  ? _todoAssigned?.todo.tasks.isNotEmpty ?? false
                  : _todo?.tasks.isNotEmpty ?? false,
              child: _TodoTaskList(
                  tasks: assigned
                      ? _todoAssigned?.todo.tasks ?? []
                      : _todo?.tasks ?? [])),
          if (assigned) Text(_todoAssigned?.assigned.toString() ?? ''),
          assigned
              ? _todoAssigned?.completed == null &&
                      _todoAssigned?.expireDate != null
                  ? Text('Expire: ${_todoAssigned?.expireDate}')
                  : const Text('DONE')
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _TodoTaskList extends StatelessWidget {
  final List<TodoTask> tasks;

  const _TodoTaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [...tasks.map((e) => TodoTaskWidget(task: e)).toList()],
    );
  }
}
