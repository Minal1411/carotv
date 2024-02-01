import 'package:carotv/core/data/error/failure.dart';
import 'package:carotv/feature/auth/data/models/login_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginModel>> postLogin(
      String username, String password);
}
