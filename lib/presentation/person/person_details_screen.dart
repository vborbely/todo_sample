import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data.dart';
import '../presentation.dart';

class PersonDetailsScreen extends StatelessWidget {
  const PersonDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _ScreenBody();
  }
}

class _ScreenBody extends StatelessWidget {
  const _ScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonCubit, PersonCubitState>(builder: (ctx, state) {
      return state.maybeWhen(
        loaded: (_, selected) => _Body(person: selected),
        error: (error) => MyErrorWidget(error: error),
        orElse: () => const MyErrorWidget(),
      );
    });
  }
}

class _Body extends StatelessWidget {
  final Person? person;

  const _Body({Key? key, required this.person}) : super(key: key);

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
          Text(person?.name ?? 'No name'),
        ],
      ),
    );
  }
}
