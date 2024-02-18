import 'package:carotv/core/resources/app_colors.dart';
import 'package:carotv/core/resources/app_styles.dart';
import 'package:carotv/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.buttonName,
    required this.status,
  });

  final String buttonName;
  final RequestStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.w,
      height: 48.h,
      decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10.r)),
      child: Center(
        child: status == RequestStatus.loading
            ? SizedBox(
                height: 20.h,
                width: 20.h,
                child: CircularProgressIndicator(
                  color: AppColors.classicYellow,
                  strokeWidth: 3.w,
                ),
              )
            : Text(
                buttonName,
                style:
                    AppTextStyle.lightText28.copyWith(color: AppColors.white),
              ),
      ),
    );
  }
}
