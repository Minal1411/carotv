import 'package:carotv/core/presentation/components/base_screen.dart';
import 'package:carotv/core/presentation/components/primary_button.dart';
import 'package:carotv/core/presentation/components/text_field_column.dart';
import 'package:carotv/core/resources/app_routes.dart';
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
                _showSnackBar(context, state.message);
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
              child: SizedBox(
                height: 540.h,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/carotv.png').pB(10.h).pT(10.h),
                    FormBuilder(
                      key: _formKey,
                      child: Column(
                        children: [
                          const TextFieldColumn(
                            fieldName: 'username',
                            hint: 'Enter username',
                            extraValidator: Validator.textValidator,
                            label: 'Username',
                          ),
                          const TextFieldColumn(
                            fieldName: 'password',
                            hint: 'Enter password',
                            extraValidator: Validator.passwordValidator,
                            label: 'Password',
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<LoginBloc>()
                                    .add(LoginButtonPressed(
                                      username: _formKey.value('username'),
                                      password: _formKey.value('password'),
                                    ));
                              }
                            },
                            child: PrimaryButton(
                              status: state.status,
                              buttonName: 'Submit',
                            ).pXY(20, 20),
                          ),
                        ],
                      ).pX(20.w),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
