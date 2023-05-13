import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/data.dart';
import '../presentation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      floatingActionButton: const _AddPersonButton(),
      body: const _ScreenBody(child: _PersonList()),
    );
  }
}

class _ScreenBody extends StatelessWidget {
  final Widget child;

  const _ScreenBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        _PersonList(),
      ],
    );
  }
}

class _PersonList extends StatelessWidget {
  const _PersonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<PersonCubit, PersonCubitState>(
        builder: (context, state) {
      final controller = context.read<PersonCubit>();
      final persons = state.maybeWhen(
          loaded: (persons, _) => persons, orElse: () => <Person>[]);
      return Container(
        constraints: BoxConstraints(maxWidth: 300, maxHeight: maxHeight),
        // Fix: Material widget needs to prevent the ListView paint outboundaries,
        // due to the underlaying ListTile widget
        child: Material(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: persons.length,
            itemBuilder: (context, index) {
              final person = persons[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    controller.selectPerson(person);
                    context.go('/person/${person.id}');
                  },
                  child: ListTile(
                    tileColor: Colors.orangeAccent,
                    minVerticalPadding: 5,
                    style: ListTileStyle.list,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    title: Text(person.name),
                    subtitle: Text('${person.age} years old'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        controller.deletePerson(person);
                      },
                    ),
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

class _AddPersonButton extends StatelessWidget {
  const _AddPersonButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final personCubit = context.watch<PersonCubit>();
    return FloatingActionButton(
      onPressed: () {
        final person = Person(
          id: 0,
          name: 'Person ${personCubit.persons.length + 1}',
          age: 20,
        );
        personCubit.addPerson(person);
      },
      child: const Icon(Icons.add),
    );
  }
}
