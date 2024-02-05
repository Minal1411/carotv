import 'package:carotv/core/presentation/components/base_screen.dart';
import 'package:carotv/core/presentation/components/text_field_column.dart';
import 'package:carotv/core/resources/app_colors.dart';
import 'package:carotv/core/resources/app_routes.dart';
import 'package:carotv/core/resources/extensions/form_field_extensions.dart';
import 'package:carotv/core/resources/extensions/padding_extensions.dart';
import 'package:carotv/core/resources/validators.dart';
import 'package:carotv/core/services/service_locator.dart';
import 'package:carotv/core/utils/enums.dart';
import 'package:carotv/feature/auth/presentation/controllers/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulHookWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static final _formKey = GlobalKey<FormBuilderState>();
  String? validatedUsername;
  String? validatedPassword;

  void _handleLogin() async {
    validatedUsername = _formKey.value<String>('username');
    validatedPassword = _formKey.value<String>('password');

    if (_formKey.currentState?.validate() ?? false) {
      final loginBloc = sl<LoginBloc>();
      loginBloc.add(LoginButtonPressed(
        username: validatedUsername!,
        password: validatedPassword!,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        print('ERROR: $state');
        if (state.status == RequestStatus.loaded) {
          // Navigate to the register screen
          Navigator.of(context).pushNamed(
            AppRoutes.registerScreen,
            arguments: [validatedUsername, validatedPassword],
          );
        } else if (state.status == RequestStatus.error) {
          // Show error snackbar
          print('ERROR: ${state.message}');
          _showSnackBar(context, state.message);
        }
      },
      child: _buildLoginForm(),
    );
  }

  Widget _buildLoginForm() {
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
                      label: 'Username',
                    ),
                    const TextFieldColumn(
                      fieldName: 'password',
                      hint: 'Enter password',
                      extraValidator: Validator.passwordValidator,
                      label: 'Password',
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: AppColors.primary,
                      ),
                      child: Center(
                        child: _buildSubmitButton(),
                      ),
                    ).pXY(20, 20),
                  ],
                ).pX(20.w),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextButton(
          onPressed:
              state.status == RequestStatus.loading ? null : _handleLogin,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          child: state.status == RequestStatus.loading
              ? const CircularProgressIndicator()
              : Text(
                  'Submit',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.classicYellow,
                      ),
                ),
        );
      },
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
