part of 'login_bloc.dart';

class LoginState extends Equatable {
  final LoginModel? loginModel;
  final RequestStatus status;
  final String message;

  const LoginState(
      {this.loginModel,
      this.status = RequestStatus.initial,
      this.message = ''});

  @override
  List<Object?> get props => [loginModel, status, message];

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
