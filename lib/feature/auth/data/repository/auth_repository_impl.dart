import 'dart:io';

import 'package:carotv/core/data/error/exceptions.dart';
import 'package:carotv/core/data/error/failure.dart';
import 'package:carotv/feature/auth/data/datasource/auth_data_source.dart';
import 'package:carotv/feature/auth/data/models/login_model.dart';
import 'package:carotv/feature/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImpl(this._authDataSource);

  @override
  Future<Either<Failure, LoginModel>> postLogin(
      String username, String password) async {
    try {
      final result = await _authDataSource.postLogin(username, password);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.errorMessage ??
          'Some error occurred. Please try again.'));
    } on DioException catch (failure) {
      if (failure.error is SocketException) {
        return const Left(ServerFailure('No internet connection.'));
      }
      return Left(
          ServerFailure(failure.message ?? 'Some unexpected error occurred.'));
    }
  }
}
