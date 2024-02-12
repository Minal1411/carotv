import 'package:carotv/core/resources/app_colors.dart';
import 'package:carotv/core/resources/app_styles.dart';
import 'package:carotv/core/resources/extensions/padding_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    this.icon,
    this.iconString,
    this.customWidget,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final IconData? icon;
  final String title;
  final VoidCallback onTap;
  final String? iconString;
  final Widget? customWidget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        children: [
          if (customWidget != null)
            customWidget!
          else if (icon != null && iconString == null)
            Icon(
              icon,
              color: AppColors.classicYellow,
              size: 26.h,
            )
          else
            SvgPicture.asset(
              iconString!,
              width: 25.w,
              height: 25.h,
            ).pX(3.w),
          Text(
            title,
            style: AppTextStyle.mediumText14
                .copyWith(color: AppColors.classicYellow),
          ).pL(20.w),
          const Spacer(),
          Icon(
            Icons.chevron_right,
            color: AppColors.classicYellow,
            size: 30.h,
          ),
        ],
      ).pXY(24.w, 20.h),
    );
  }
}
