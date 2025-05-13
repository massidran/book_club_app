import 'package:book_club_app/authentication_bloc/authentication_bloc.dart';
import 'package:book_club_app/pages/router_demo_home.dart';
import 'package:book_club_app/pages/router_demo_login.dart';
import 'package:book_club_app/pages/router_demo_profile.dart';
import 'package:book_club_app/pages/router_demo_book_detail.dart';
import 'package:book_club_app/pages/router_demo_by_author.dart';
import 'package:book_club_app/pages/router_demo_by_title.dart';
import 'package:book_club_app/utilities/stream_to_listenable.dart';
import 'package:book_club_app/widgets/scaffold_with_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteName {
  static const home = "home";
  static const byAuthor = "byAuthor";
  static const byAuthorDetail = "byAuthorDetail";
  static const byTitle = "byTitle";
  static const byTitleDetail = "byTitleDetail";
  static const profile = "profile";
  static const login = "login";
}

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: "Root",
);
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: "Shell",
);

GoRouter routerDemo(AuthenticationBloc authenticationBloc) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/login',
    refreshListenable: StreamToListenable([authenticationBloc.stream]),
    redirect: (context, state) async {
      if (authenticationBloc.state is AuthenticationLoggedOut &&
          (!(state.fullPath?.startsWith("/login") ?? false))) {
        return "/login";
      } else {
        if ((state.fullPath?.startsWith("/login") ?? false) &&
            authenticationBloc.state is AuthenticationLoggedIn) {
          return "/byAuthor";
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        name: RouteName.login,
        builder: (context, state) {
          return const RouterDemoLogin();
        },
      ),
      GoRoute(
        path: '/',
        name: RouteName.home,
        builder: (context, state) {
          return const RouterDemoHome();
        },
        routes: [
          ShellRoute(
            navigatorKey: shellNavigatorKey,
            builder: (BuildContext context, GoRouterState state, Widget child) {
              return ScaffoldWithNavBar(child: child);
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'byAuthor',
                name: RouteName.byAuthor,
                builder: (BuildContext context, GoRouterState state) {
                  return const RouterDemoByAuthor();
                },
                routes: [
                  GoRoute(
                    path: 'detail',
                    name: RouteName.byAuthorDetail,
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (BuildContext context, GoRouterState state) {
                      return const RouterDemoBookDetail();
                    },
                  ),
                ],
              ),
              GoRoute(
                path: 'byTitle',
                name: RouteName.byTitle,
                builder: (BuildContext context, GoRouterState state) {
                  return const RouterDemoByTitle();
                },
                routes: [
                  GoRoute(
                    path: 'detail',
                    name: RouteName.byTitleDetail,
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (BuildContext context, GoRouterState state) {
                      return const RouterDemoBookDetail();
                    },
                  ),
                ],
              ),
              GoRoute(
                path: 'profile',
                name: RouteName.profile,
                builder: (BuildContext context, GoRouterState state) {
                  return const RouterDemoProfile();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
