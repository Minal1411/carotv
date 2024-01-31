import 'package:carotv/core/presentation/components/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    Key? key,
    required this.child,
    required this.pageTitle,
    this.actions,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.noBackButton = false,
  }) : super(key: key);

  final Widget child;
  final String pageTitle;
  final List<Widget>? actions;
  final bool noBackButton;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        bottomSheet: bottomSheet,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        body: SizedBox(
          height: double.infinity,
          child: Column(
            children: [
              CaroTvAppBar(
                title: pageTitle,
                titleFontSize: 20.sp,
                noBackButton: noBackButton,
                onBackPressed: () => Navigator.of(context).pop(),
                actions: actions,
                actionPadding: actions != null ? 10.w : null,
              ),
              child
            ],
          ),
        ),
      ),
    );
  }
}
