import 'package:bloc_sample/presentation/person/persion_details_screen.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/presentation.dart';

abstract class AppRoute {
  static const String home = '/';
  static const String personDetails = '/personDetails';
  static const String settings = '/settings';
}

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      name: AppRoute.home,
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: AppRoute.personDetails,
      path: '/person/:id',
      builder: (context, state) => const PersonDetailsScreen(),
    ),
    GoRoute(
      name: AppRoute.settings,
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);
