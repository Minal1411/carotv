import 'package:carotv/core/resources/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GestureDetector(
              onTap: () {
                context.goNamed(AppRoutes.loginScreen);
              },
              child: const Text('Signup Screen'))),
    );
  }
}
