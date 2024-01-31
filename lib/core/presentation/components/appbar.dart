import 'package:carotv/core/resources/app_colors.dart';
import 'package:carotv/core/resources/extensions/padding_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CaroTvAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CaroTvAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.onBackPressed,
    this.titleFontSize,
    this.leftPadding,
    this.actionPadding,
  }) : super(key: key);

  final String title;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final double? titleFontSize;
  final double? leftPadding;
  final double? actionPadding;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(100.h),
      child: Container(
        height: 70.h,
        width: double.infinity,
        color: AppColors.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                5.horizontalSpace,
                BackButton(
                  color: AppColors.classicYellow,
                  onPressed: onBackPressed ?? () => Navigator.pop(context),
                ),
                const Spacer(),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: titleFontSize ?? 24,
                      color: AppColors.classicYellow),
                ).pR(20.w),
                const Spacer(),
                if (actions != null) ...actions!,
                if (actionPadding != null)
                  actionPadding!.horizontalSpace
                else
                  24.horizontalSpace,
              ],
            ).pB(3.h),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.h);
}
