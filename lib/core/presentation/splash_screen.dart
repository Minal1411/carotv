import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Make background transparent
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Color(0xFF009C4E), // #009C4E
                  Color(0xFF006231), // #006231
                ],
                stops: [0.045, 1.0],
                center: Alignment(0, 0), // 50% 24.41% at 50% 50%
                focal: Alignment(0, 0), // Default focal point is center
              ),
            ),
            // Child widgets of your Scaffold go here
          ),
          Align(
              alignment: AlignmentDirectional.center,
              child: SvgPicture.asset(
                'assets/svg/app_logo.svg',
                height: 125.h,
              ))
        ],
      ),
    );
  }
}
