import 'package:carotv/core/data/error/exceptions.dart';
import 'package:carotv/core/data/network/api_constants.dart';
import 'package:carotv/core/data/network/error_message_model.dart';
import 'package:carotv/feature/auth/data/models/login_model.dart';
import 'package:dio/dio.dart';

abstract class AuthDataSource {
  Future<LoginModel> postLogin(String username, String password);
}

Dio dio = Dio();

class AuthDataSourceImpl extends AuthDataSource {
  @override
  Future<LoginModel> postLogin(String username, String password) async {
    try {
      final response = await dio.post(ApiConstants.loginUrl, data: {
        'username': username,
        'password': password,
      });
      if (response.statusCode == 200) {
        return LoginModel.fromJson(response.data);
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
