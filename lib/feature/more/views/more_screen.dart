import 'package:carotv/core/presentation/components/base_screen.dart';
import 'package:carotv/core/presentation/splash_screen.dart';
import 'package:carotv/core/resources/app_colors.dart';
import 'package:carotv/core/resources/app_styles.dart';
import 'package:carotv/core/resources/extensions/padding_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        pageTitle: 'More',
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Icon(
                Icons.notifications_active_outlined,
                color: AppColors.white,
                size: 28.w,
              ).pR(27.w).pB(21.h).pT(12.h),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/test_image.png',
                    height: 159.h,
                    width: 159.w,
                  ).pB(27.h),
                  Center(
                    child: Text(
                      'Hello Username,',
                      style: AppTextStyle.regularText32
                          .copyWith(color: Colors.white),
                    ).pB(56.h),
                  ),
                  MoreContainer(
                    iconPath: 'assets/svg/account_icon.svg',
                    title: 'Personal Details',
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (_) => const SplashScreen()));
                    },
                  ),
                  MoreContainer(
                    iconPath: 'assets/svg/settings_icon.svg',
                    title: 'Settings',
                    onTap: () {},
                  ),
                  MoreContainer(
                    iconPath: 'assets/svg/contacts_icon.svg',
                    title: 'Contact Us',
                    onTap: () {},
                  ),
                  MoreContainer(
                    iconPath: 'assets/svg/privacy_icon.svg',
                    title: 'Privacy Policy',
                    onTap: () {},
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                        height: 57.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFFFF0202),
                              Color(0xFFBF0000),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Logout',
                            style: AppTextStyle.regularText30
                                .copyWith(color: Colors.white),
                          ),
                        )).pB(35.h),
                  ),
                ],
              ).pL(78.w).pR(71.w),
            ),
          ],
        ));
  }
}

class MoreContainer extends StatelessWidget {
  const MoreContainer(
      {super.key,
      required this.iconPath,
      required this.title,
      required this.onTap});

  final String iconPath;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 57.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              width: 36.w,
              height: 36.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF03A051),
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  width: 24.w,
                ),
              ),
            ).pX(16.w),
            Text(
              title,
              style: AppTextStyle.regularText20.copyWith(color: Colors.black),
            ),
          ],
        ),
      ).pB(35.h),
    );
  }
}
