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
    this.noAppBar = true,
    this.noBg = false,
  }) : super(key: key);

  final Widget child;
  final String pageTitle;
  final List<Widget>? actions;
  final bool noBackButton;
  final bool? noAppBar;
  final bool? noBg;
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
        backgroundColor: Colors.transparent,
        // Make Scaffold's background transparent
        body: Container(
          decoration: noBg!
              ? const BoxDecoration()
              : const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF003b1b),
                      Color(0xFF008f47),
                    ],
                  ),
                ),
          child: Column(
            children: [
              noAppBar!
                  ? SizedBox(
                      height: 15.h,
                    )
                  : AppBar(
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
                      actions: actions ?? [],
                      backgroundColor: Colors.transparent,
                      // Make AppBar's background transparent
                      elevation: 0, // Remove AppBar's shadow
                    ),
              Expanded(child: child),
            ],
          ),
        ),
        bottomSheet: bottomSheet,
        drawer: drawer,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
