import 'package:carotv/core/presentation/components/decorations.dart';
import 'package:carotv/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackButton extends StatelessWidget {
  const BackButton({Key? key, this.onPressed}) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () => Navigator.maybePop(context),
      child: Container(
        padding: EdgeInsets.only(left: 10.w),
        decoration: getShadowDecoration().copyWith(
          borderRadius: BorderRadiusDirectional.circular(100),
        ),
        height: 38.h,
        width: 38.h,
        child: Icon(
          Icons.arrow_back_ios,
          color: AppColors.classicYellow,
          size: 20.r,
        ),
      ),
    );
  }
}
