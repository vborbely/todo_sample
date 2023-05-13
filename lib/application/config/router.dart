import 'package:bloc_sample/presentation/person/persion_details_screen.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/presentation.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      name: '/',
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: '/personDetails',
      path: '/person/:id',
      builder: (context, state) => const PersonDetailsScreen(),
    ),
  ],
);
