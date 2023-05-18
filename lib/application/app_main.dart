import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:todo_sample/data/data.dart';

import '../presentation/presentation.dart';
import 'application.dart';

class AppMain extends StatefulWidget {
  const AppMain({Key? key}) : super(key: key);

  @override
  State<AppMain> createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  late StorageService _storageService;
  late SettingsRepository _settingsRepository;
  bool _allInitialized = false;

  @override
  void initState() {
    super.initState();
    _beforeStartup();
  }

  Future<bool> _beforeStartup() async {
    _storageService = StorageService();
    await _storageService.init();
    _settingsRepository = SettingsRepository(storageCubit: _storageService);
    await _settingsRepository.init();
    _allInitialized = true;
    return _allInitialized;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _beforeStartup(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data == true) {
          return _LauncherApp(
            settingsRepository: _settingsRepository,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class _LauncherApp extends StatelessWidget {
  final SettingsRepository settingsRepository;

  const _LauncherApp({Key? key, required this.settingsRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      // MOCK if needed
      providers: [
        RepositoryProvider<TodoRepository>(
          create: (context) => TodoRepository(),
        ),
        RepositoryProvider<PersonRepository>(
          create: (context) => PersonRepository(),
        ),
        RepositoryProvider<SettingsRepository>(
          create: (context) => settingsRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<TodoCubit>(
            create: (BuildContext context) {
              return TodoCubit(
                todoRepository: TodoRepository(),
              )..loadTodos();
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
                settingsRepository: settingsRepository,
              )..init();
            },
          ),
        ],
        child: BlocBuilder<SettingsCubit, SettingsCubitState>(
          builder: (_, settingsState) {
            final theme = settingsState.maybeWhen(
              loaded: (settings) => settings[SettingsKey.darkMode]?.asValue,
              orElse: () => true,
            );

            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              // localization
              title: 'Flutter Bloc Sample',
              theme: !theme
                  ? ThemeData(
                      primarySwatch: Colors.lime,
                    )
                  : ThemeData.dark(),
              routerConfig: router,
              builder: (ctx, widget) => Navigator(
                onGenerateRoute: (_) => MaterialPageRoute(
                  builder: (_) => FlavorBanner(child: widget!),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
