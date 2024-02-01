import 'package:carotv/core/data/error/failure.dart';
import 'package:carotv/core/domain/usecase/base_use_case.dart';
import 'package:carotv/feature/auth/data/models/login_model.dart';
import 'package:carotv/feature/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase extends BaseUseCase<LoginModel, LoginParameters> {
  LoginUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, LoginModel>> call(LoginParameters p) async {
    return await _authRepository.postLogin(p.username, p.password);
  }
}

class LoginParameters extends NoParameters {
  final String username;
  final String password;

  LoginParameters({
    required this.username,
    required this.password,
  }) : super();

  @override
  List<Object?> get props => [username, password];
}
