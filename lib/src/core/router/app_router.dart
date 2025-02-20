import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guider/src/core/supabase/supabase_injection.dart';
import 'package:guider/src/core/widgets/tab_bar/tab_bar.dart';
import 'package:guider/src/features/create_route/presentation/screens/create_route_screen.dart';
import 'package:guider/src/features/map/presentation/screens/map_screen.dart';
import 'package:guider/src/features/routes_list/presentation/screens/routes_list_screen.dart';
import 'package:guider/src/features/sign_in/presentation/screens/sign_in_screen.dart';
import 'package:guider/src/features/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:guider/src/features/user_profile/presentation/screens/user_profile_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GuiderNavigationHelper {
  static final GuiderNavigationHelper _instance =
      GuiderNavigationHelper._internal();

  static GuiderNavigationHelper get instance => _instance;

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> mapTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> userTabNavigatorKey =
      GlobalKey<NavigatorState>();

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  static const String signInPath = '/signIn';
  static const String signUpPath = '/signUp';

  static const String mapPath = '/map';
  static const String userPath = '/user';

  static const String createRoutePath = '/createRoute';
  static const String routesListPath = '/routesList';

  factory GuiderNavigationHelper() {
    return _instance;
  }

  GuiderNavigationHelper._internal() {
    final routes = [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            navigatorKey: mapTabNavigatorKey,
            routes: [
              GoRoute(
                path: mapPath,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: MapScreen(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: userTabNavigatorKey,
            routes: [
              GoRoute(
                path: userPath,
                pageBuilder: (context, state) {
                  return getPage(
                    child: const UserProfileScreen(),
                    state: state,
                  );
                },
              ),
            ],
          ),
        ],
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return getPage(
            child: BottomNavigatonPage(
              child: navigationShell,
            ),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: signInPath,
        pageBuilder: (context, state) {
          return getPage(
            child: const SignInScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: signUpPath,
        pageBuilder: (context, state) {
          return getPage(
            child: const SignUpScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: createRoutePath,
        pageBuilder: (context, state) {
          return getPage(child: const CreateRouteScreen(), state: state);
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: routesListPath,
        pageBuilder: (context, state) {
          return getPage(child: const RoutesListScreen(), state: state);
        },
      ),
    ];

    final supabase = sl.get<Supabase>().client.auth;

    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: supabase.currentSession == null ? signInPath : mapPath,
      routes: routes,
    );
  }

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
