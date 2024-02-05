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
    final dio = Dio();

    // Set a custom validateStatus function that does not throw for 404
    dio.options.validateStatus = (status) {
      return status == null || (status >= 200 && status < 300) || status == 404;
    };

    final options = Options(
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
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
      print('Post Request Status Code: ${response.statusCode}');
      print('Post Request Status Message: ${response.data}');
      print('Post Request Data: ${response.requestOptions.data}');
    }

    if (response.statusCode == 200) {
      return LoginModel.fromJson(response.data);
    } else if (response.statusCode == 404) {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
