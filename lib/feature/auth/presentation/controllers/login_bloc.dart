import 'package:bloc/bloc.dart';
import 'package:carotv/core/utils/enums.dart';
import 'package:carotv/feature/auth/data/models/login_model.dart';
import 'package:carotv/feature/auth/domain/usecases/login_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase) : super(LoginState()) {
    if (kDebugMode) {
      print('LoginBloc Initialized');
    }
    on<LoginButtonPressed>(_postLogin);

    stream.listen((state) {
      if (kDebugMode) {
        print('Current State:$state ');
      }
    });
  }

  Future<void> _postLogin(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(const LoginState(status: RequestStatus.loading));

    final loginParameters =
        LoginParameters(username: event.username, password: event.password);
    final result = await _loginUseCase(loginParameters);

    result.fold(
      (l) {
        if (kDebugMode) {
          print('Login failed: ${l.message}');
        }
        emit(LoginState(status: RequestStatus.error, message: l.message));
      },
      (r) {
        if (kDebugMode) {
          print('Login successful');
        }
        emit(LoginState(status: RequestStatus.loaded, loginModel: r));
      },
    );
  }
}
