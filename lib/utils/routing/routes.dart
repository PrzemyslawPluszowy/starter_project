import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starter/features/feed/feed_screen.dart';
import 'package:starter/features/starer_page/ui/start_screen.dart';
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
        return StartScreen();
      },
      routes: [
        GoRoute(
          path: 'home',
          name: RouteName.home,
          pageBuilder: (context, state) {
            return _fadeTransition(state, const FeedScreen());
          },
        ),
      ],
    ),
  ],
);

CustomTransitionPage<void> _fadeTransition(GoRouterState state, Widget child) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(
            opacity: animation.drive(
              Tween<double>(
                begin: 0,
                end: 1,
              ).chain(CurveTween(curve: Curves.easeIn)),
            ),
            child: child),
  );
}
