import 'package:carotv/core/resources/app_routes.dart';
import 'package:carotv/feature/auth/presentation/views/login_screen.dart';
import 'package:carotv/feature/auth/presentation/views/register_screen.dart';
import 'package:carotv/feature/dashboard/presentation/views/dashboard_screen.dart';
import 'package:carotv/feature/search/presentation/views/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

const String loginScreen = '/loginScreen';
const String registerScreen = 'registerScreen';
const String dashBoardScreen = '/dashBoardScreen';
const String searchScreen = 'searchScreen';

class AppRouter {
  GoRouter router = GoRouter(initialLocation: loginScreen, routes: [
    GoRoute(
        name: AppRoutes.loginScreen,
        path: loginScreen,
        pageBuilder: (context, state) =>
            const CupertinoPage(child: LoginScreen()),
        routes: [
          GoRoute(
            name: AppRoutes.registerScreen,
            path: registerScreen,
            pageBuilder: (context, state) {
              final data = state.extra as Map<String, Object?>;
              return CupertinoPage(
                  child: RegisterScreen(
                username: data['username'] as String,
                password: data['password'] as String,
              ));
            },
          ),
        ]),
    GoRoute(
        name: AppRoutes.dashBoardScreen,
        path: dashBoardScreen,
        pageBuilder: (context, state) =>
            const CupertinoPage(child: DashBoardScreen()),
        routes: [
          GoRoute(
            name: AppRoutes.searchScreen,
            path: searchScreen,
            pageBuilder: (context, state) =>
                const CupertinoPage(child: SearchScreen()),
          ),
        ]),
  ]);
}
