import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starter/common/navigation/navigation_layout.dart';
import 'package:starter/features/feed/ui/feed_screen.dart';
import 'package:starter/features/starer_page/ui/start_screen.dart';
import 'package:starter/utils/routing/const_route.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavFeedKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavTableKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavCalendarKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: RouteName.init,
      builder: (context, state) {
        return StartScreen();
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavigationLayout(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavFeedKey,
          routes: [
            GoRoute(
                path: '/feed',
                name: RouteName.feed,
                builder: (context, state) => const FeedScreen()),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavTableKey,
          routes: [
            GoRoute(
              path: '/table',
              name: RouteName.table,
              builder: (context, state) => Container(
                color: Colors.blue,
                child: const Center(
                  child: Text('table'),
                ),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavCalendarKey,
          routes: [
            GoRoute(
              path: '/calendar',
              name: RouteName.calendar,
              builder: (context, state) => Container(
                color: Colors.green,
                child: const Center(
                  child: Text('Kalendarz'),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/login',
      name: RouteName.login,
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: const Center(
          child: Text('Login'),
        ),
      ),
    ),
  ],
);
