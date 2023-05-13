import 'package:bloc_sample/data/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/presentation.dart';
import 'application.dart';

class AppMain extends StatelessWidget {
  AppMain({Key? key}) : super(key: key);
  final Environment _environment = Environment();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      // MOCK if needed
      providers: [
        RepositoryProvider<PersonRepository>(
          create: (context) => PersonRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PersonCubit>(
            create: (BuildContext context) {
              return PersonCubit(
                personRepository: PersonRepository(),
              )..loadPersons();
            },
          ),
        ],
        child: MaterialApp.router(
          // localization
          title: 'Flutter Bloc Sample',
          theme: ThemeData(
            primarySwatch: Colors.lime,
          ),
          routerConfig: router,
        ),
      ),
    );
  }
}
