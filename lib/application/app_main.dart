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
      providers: [
        RepositoryProvider<PersonRepository>(
          create: (context) => PersonRepository(),
        ),
      ],
      child: MaterialApp(
        // localization
        // router
        title: 'Flutter Bloc Sample',
        theme: ThemeData(
          primarySwatch: Colors.lime,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
