import 'package:carotv/core/resources/app_routes.dart';
import 'package:carotv/feature/auth/presentation/views/login_screen.dart';
import 'package:carotv/feature/auth/presentation/views/signup_screen.dart';
import 'package:carotv/feature/dashboard/presentation/views/dashboard_screen.dart';
import 'package:carotv/feature/search/presentation/views/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

const String loginScreen = '/loginScreen';
const String signupScreen = '/signupScreen';
const String dashBoardScreen = '/dashBoardScreen';
const String searchScreen = 'searchScreen';

class AppRouter {
  GoRouter router = GoRouter(initialLocation: dashBoardScreen, routes: [
    GoRoute(
      name: AppRoutes.loginScreen,
      path: loginScreen,
      pageBuilder: (context, state) =>
          const CupertinoPage(child: LoginScreen()),
    ),
    GoRoute(
      name: AppRoutes.signupScreen,
      path: signupScreen,
      pageBuilder: (context, state) =>
          const CupertinoPage(child: SignupScreen()),
    ),
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
