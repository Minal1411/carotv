import 'package:carotv/core/resources/app_colors.dart';
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
      width: double.infinity,
      height: 40.h,
      decoration: BoxDecoration(
          color: AppColors.primary, borderRadius: BorderRadius.circular(10.r)),
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
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.classicYellow,
                    ),
              ),
      ),
    );
  }
}
