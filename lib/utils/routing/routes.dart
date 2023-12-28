import 'package:go_router/go_router.dart';
import 'package:starter/features/Login/presentation/pages/login_screen.dart';
import 'package:starter/utils/routing/const_route.dart';

import '../../main.dart';

final GoRouter router = GoRouter(
    navigatorKey: MyApp.navigatorKey,
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
          path: '/',
          name: RouteName.init,
          builder: (context, state) {
            return const LoginScreen();
          }),
    ]);
