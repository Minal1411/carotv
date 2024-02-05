import 'package:carotv/core/data/error/exceptions.dart';
import 'package:carotv/core/data/network/api_constants.dart';
import 'package:carotv/core/data/network/error_message_model.dart';
import 'package:carotv/feature/auth/data/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class AuthDataSource {
  Future<LoginModel> postLogin(String username, String password);
}

class AuthDataSourceImpl extends AuthDataSource {
  @override
  Future<LoginModel> postLogin(String username, String password) async {
    try {
      final dio = Dio();

      // Log request details before making the request
      final options = Options(
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        }, // Adjust headers as needed
      );
      final requestUri = Uri.parse(ApiConstants.loginUrl);
      print('Pre Request URL: $requestUri');
      print('Pre Request Headers: ${options.headers}');
      print(
          'Pre Request Body: { "username": "$username", "password": "$password" }');

      final response = await dio.post(
        ApiConstants.loginUrl,
        options: options,
        data: {'username': username, 'password': password},
      );

      if (kDebugMode) {
        // Log the request details again after making the request
        print('Post Request URL: ${response.requestOptions.uri}');
        print('Post Request Headers: ${response.requestOptions.headers}');
        print('Post Request Body: ${response.requestOptions.data}');
      }

      if (response.statusCode == 200) {
        return LoginModel.fromJson(response.data);
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (error) {
      // Log the error for debugging purposes
      print('Error in postLogin: $error');
      throw Exception(error);
    }
  }
}
