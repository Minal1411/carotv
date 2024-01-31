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
    this.noBackButton,
  }) : super(key: key);

  final String title;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final double? titleFontSize;
  final double? leftPadding;
  final double? actionPadding;
  final bool? noBackButton;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(100.h),
      child: Container(
        height: 70.h,
        width: double.infinity,
        color: AppColors.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                noBackButton!
                    ? SizedBox(width: 28.h)
                    : GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_circle_left_outlined,
                          color: AppColors.classicYellow,
                          size: 28.h,
                        ).pL(10.w),
                      ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: titleFontSize ?? 24,
                            color: AppColors.classicYellow,
                          ),
                    ).pR(actions != null && noBackButton == false ? 12 : 0),
                  ),
                ),
                if (actions != null) ...actions!,
                actions != null ? 10.horizontalSpace : 42.horizontalSpace,
              ],
            ).pB(noBackButton! ? 9.h : 7.h),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.h);
}
