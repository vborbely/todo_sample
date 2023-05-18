import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data.dart';
import '../presentation.dart';

class TodoDetailsScreen extends StatelessWidget {
  const TodoDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _ScreenBody();
  }
}

class _ScreenBody extends StatelessWidget {
  const _ScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoCubitState>(builder: (ctx, state) {
      return state.maybeWhen(
        loaded: (_, selected) => _Body(todo: selected),
        error: (error) => MyErrorWidget(error: error),
        orElse: () => const MyErrorWidget(),
      );
    });
  }
}

class _Body extends StatelessWidget {
  final Todo? todo;

  const _Body({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const AppBarColorize(),
        title: const Text(
          'Details',
          style: appBarTextStyle,
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(todo?.title ?? 'No name'),
        ],
      ),
    );
  }
}
