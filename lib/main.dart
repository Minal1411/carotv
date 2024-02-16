import 'package:carotv/core/resources/app_router.dart';
import 'package:carotv/core/resources/app_strings.dart';
import 'package:carotv/core/resources/app_theme.dart';
import 'package:carotv/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  ServiceLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
    );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: getApplicationTheme(),
      routerConfig: router,
    );
  }
}
