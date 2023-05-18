import '../../data/data.dart';
import '../presentation.dart';

class TodoTaskWidget extends StatelessWidget {
  final TodoTask task;

  const TodoTaskWidget({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: task.completed ?? false,
          onChanged: (value) {
            // task.completed = value;
            // context.read<TodoController>().updateTask(task);
          },
        ),
        Expanded(
          child: Text(task.description ?? ''),
        ),
      ],
    );
  }
}
