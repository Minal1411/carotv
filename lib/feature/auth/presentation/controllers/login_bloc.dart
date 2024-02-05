import 'package:bloc/bloc.dart';
import 'package:carotv/core/utils/enums.dart';
import 'package:carotv/feature/auth/data/models/login_model.dart';
import 'package:carotv/feature/auth/domain/usecases/login_usecase.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase)
      : super(const LoginState(status: RequestStatus.initial)) {
    on<LoginButtonPressed>(_postLogin);
  }

  Future<void> _postLogin(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: RequestStatus.loading));

    final loginParameters =
        LoginParameters(username: event.username, password: event.password);
    final result = await _loginUseCase(loginParameters);

    result.fold((failure) {
      emit(state.copyWith(
          status: RequestStatus.error, message: failure.message));
    }, (loginModel) {
      emit(
          state.copyWith(status: RequestStatus.loaded, loginModel: loginModel));
    });
  }
}
