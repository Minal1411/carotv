import 'package:carotv/core/resources/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GestureDetector(
              onTap: () {
                context.goNamed(AppRoutes.signupScreen);
              },
              child: const Text('Login Screen'))),
    );
  }
}
