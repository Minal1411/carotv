import 'package:carotv/core/resources/app_colors.dart';
import 'package:carotv/core/resources/app_styles.dart';
import 'package:carotv/core/resources/extensions/padding_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    Key? key,
    required this.pageTitle,
    required this.child,
    this.actions,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.drawer,
    this.noBackButton = false,
    this.appBarAction,
  }) : super(key: key);

  final Widget child;
  final String pageTitle;
  final List<Widget>? actions;
  final bool noBackButton;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? appBarAction;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: noBackButton
              ? Builder(
                  builder: (context) => SizedBox(
                    width: 28.h,
                    child: IconButton(
                      icon: const Icon(
                        Icons.menu, // This is the drawer icon
                        color: AppColors.classicYellow,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Icon(
                    Icons.arrow_circle_left_outlined,
                    color: AppColors.classicYellow,
                    size: 28.h,
                  ).pL(10.w),
                ),
          title: Text(
            pageTitle,
            style: AppTextStyle.boldText20.copyWith(
              color: AppColors.classicYellow,
            ),
          ),
          centerTitle: true,
          actions: [],
        ),
        bottomSheet: bottomSheet,
        drawer: drawer,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        body: SizedBox(
          height: double.infinity,
          child: Column(
            children: [
              // CaroTvAppBar(
              //   title: pageTitle,
              //   titleFontSize: 20.sp,
              //   noBackButton: noBackButton,
              //   onBackPressed: () => Navigator.of(context).pop(),
              //   actions: actions,
              //   actionPadding: actions != null ? 10.w : null,
              // ),
              Expanded(child: child)
            ],
          ),
        ),
      ),
    );
  }
}
