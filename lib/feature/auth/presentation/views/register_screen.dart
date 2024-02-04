import 'package:carotv/core/presentation/components/base_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen(
      {super.key, required this.username, required this.password});

  final String username;
  final String password;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      pageTitle: 'Register',
      child: Center(child: Text('Username: $username and Password: $password')),
    );
    ;
  }
}
