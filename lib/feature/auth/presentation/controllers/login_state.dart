part of 'login_bloc.dart';

class LoginState {
  final LoginModel? loginModel;
  final RequestStatus status;
  final String message;

  const LoginState(
      {this.loginModel,
      this.status = RequestStatus.loading,
      this.message = ''});

  LoginState copyWith({
    LoginModel? loginModel,
    RequestStatus? status,
    String? message,
  }) {
    return LoginState(
        loginModel: loginModel ?? this.loginModel,
        status: status ?? this.status,
        message: message ?? this.message);
  }
}
