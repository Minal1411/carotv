import 'package:carotv/core/presentation/components/base_screen.dart';
import 'package:carotv/core/presentation/components/text_field_column.dart';
import 'package:carotv/core/resources/app_colors.dart';
import 'package:carotv/core/resources/app_routes.dart';
import 'package:carotv/core/resources/extensions/form_field_extensions.dart';
import 'package:carotv/core/resources/extensions/padding_extensions.dart';
import 'package:carotv/core/resources/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulHookWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      pageTitle: 'Login',
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: 600.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.home_outlined,
                size: 100.h,
                color: AppColors.primary,
              ).pB(50.h).pT(30.h),
              FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    const TextFieldColumn(
                        fieldName: 'username',
                        hint: 'Enter username',
                        label: 'Username'),
                    const TextFieldColumn(
                        fieldName: 'password',
                        hint: 'Enter password',
                        extraValidator: Validator.passwordValidator,
                        label: 'Password'),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          final username = _formKey.value<String>('username');
                          final password = _formKey.value<String>('password');
                          print('Username:$username');
                          print('Password:$password');

                          if (mounted) {
                            context.goNamed(AppRoutes.registerScreen, extra: {
                              'username': username,
                              'password': password,
                            });
                          }
                        }
                      },
                      child: Container(
                        height: 40.h,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: AppColors.primary,
                        ),
                        child: Center(
                          child: Text(
                            'Submit',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: AppColors.classicYellow),
                          ),
                        ),
                      ).pXY(20, 20),
                    ),
                  ],
                ).pX(20.w),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
