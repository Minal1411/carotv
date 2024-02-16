import 'package:carotv/core/presentation/components/base_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      pageTitle: 'Register',
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/icons/caro_tv_icon.png',
            )
          ],
        ),
      ),
    );
  }
}
