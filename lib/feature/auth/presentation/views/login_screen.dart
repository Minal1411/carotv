import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:carotv/core/presentation/components/base_screen.dart';
import 'package:carotv/core/presentation/components/carotvSnackbar.dart';
import 'package:carotv/core/presentation/components/carotv_text_field.dart';
import 'package:carotv/core/presentation/components/primary_button.dart';
import 'package:carotv/core/resources/app_colors.dart';
import 'package:carotv/core/resources/app_routes.dart';
import 'package:carotv/core/resources/app_styles.dart';
import 'package:carotv/core/resources/extensions/form_field_extensions.dart';
import 'package:carotv/core/resources/extensions/padding_extensions.dart';
import 'package:carotv/core/resources/validators.dart';
import 'package:carotv/core/services/service_locator.dart';
import 'package:carotv/core/utils/enums.dart';
import 'package:carotv/feature/auth/presentation/controllers/login_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return BlocProvider(
      create: (context) => sl<LoginBloc>(),
      child: BaseScreen(
        pageTitle: 'Login',
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (kDebugMode) {
              print('Listener State: $state');
            }

            switch (state.status) {
              case RequestStatus.error:
                showSnackBar(
                    context, 'OOPS!', state.message, ContentType.failure);
                break;
              case RequestStatus.loaded:
                context.goNamed(AppRoutes.registerScreen, extra: [
                  _formKey.value('username'),
                  _formKey.value('password'),
                ]);
                break;
              default:
                // Handle other states if needed
                break;
            }
          },
          builder: (context, state) {
            if (kDebugMode) {
              print('Builder State: $state');
            }
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'assets/svg/app_logo.svg',
                      height: 70.h,
                    ),
                  ).pT(50.h).pB(80.h),
                  Text('Login',
                          style: AppTextStyle.regularText50
                              .copyWith(color: Colors.white))
                      .pB(15.h),
                  Text('Please sign in to continue',
                          style: AppTextStyle.regularText20
                              .copyWith(color: Colors.white))
                      .pB(40.h),
                  FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: [
                        const CarotvTextField(
                          fieldName: 'username',
                          hint: 'Email',
                          extraValidator: Validator.textValidator,
                          label: 'Email',
                          prefixIcon: Icon(
                            Icons.person,
                            color: AppColors.primary,
                          ),
                        ).pB(16.h),
                        const CarotvTextField(
                          fieldName: 'password',
                          hint: 'Password',
                          extraValidator: Validator.passwordValidator,
                          label: 'Password',
                          isPassword: true,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: AppColors.primary,
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            'Forget Password?',
                            style: AppTextStyle.lightText14.copyWith(
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white),
                          ).pY(26.h),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              context.read<LoginBloc>().add(LoginButtonPressed(
                                    username: _formKey.value('username'),
                                    password: _formKey.value('password'),
                                  ));
                            }
                          },
                          child: PrimaryButton(
                            status: state.status,
                            buttonName: 'Login',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ).pX(42.w),
            );
          },
        ),
      ),
    );
  }
}
