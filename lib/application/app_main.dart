import 'package:bloc_sample/data/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import '../presentation/presentation.dart';
import 'application.dart';

class AppMain extends StatelessWidget {
  const AppMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storageCubit = StorageCubit()..init();

    return MultiRepositoryProvider(
      // MOCK if needed
      providers: [
        RepositoryProvider<PersonRepository>(
          create: (context) => PersonRepository(),
        ),
        RepositoryProvider<SettingsRepository>(
          create: (context) => SettingsRepository(storageCubit: storageCubit),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<StorageCubit>(
            create: (BuildContext context) {
              return storageCubit;
            },
          ),
          BlocProvider<PersonCubit>(
            create: (BuildContext context) {
              return PersonCubit(
                personRepository: PersonRepository(),
              )..loadPersons();
            },
          ),
          BlocProvider<SettingsCubit>(
            create: (BuildContext context) {
              return SettingsCubit(
                settingsRepository: SettingsRepository(
                  storageCubit: storageCubit,
                ),
              )..init();
            },
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          // localization
          title: 'Flutter Bloc Sample',
          theme: ThemeData(
            primarySwatch: Colors.lime,
          ),
          routerConfig: router,
          builder: (ctx, widget) => Navigator(
            onGenerateRoute: (_) => MaterialPageRoute(
              builder: (_) => FlavorBanner(child: widget!),
            ),
          ),
        ),
      ),
    );
  }
}
