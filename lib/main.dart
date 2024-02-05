import 'package:carotv/core/resources/app_router.dart';
import 'package:carotv/core/resources/app_strings.dart';
import 'package:carotv/core/resources/app_theme.dart';
import 'package:carotv/core/services/service_locator.dart';
import 'package:carotv/feature/auth/presentation/controllers/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  ServiceLocator.init();
  runApp(BlocProvider(
    create: (context) => sl<LoginBloc>(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
    );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: getApplicationTheme(),
      routerConfig: AppRouter().router,
    );
  }
}
