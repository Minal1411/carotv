import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int? statusCode;
  final String? statusMessage;
  final bool? success;
  final String? errorMessage;
  final dynamic data;

  const ErrorMessageModel({
    this.statusCode,
    this.statusMessage,
    this.success,
    this.errorMessage,
    this.data,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('error')) {
      return ErrorMessageModel(
        errorMessage: json['error'],
      );
    } else if (json.containsKey('status') &&
        json.containsKey('message') &&
        json.containsKey('data')) {
      return ErrorMessageModel(
        success: json['status'],
        errorMessage: json['message'],
        data: json['data'],
      );
    } else {
      // Handle unknown error structure
      return const ErrorMessageModel(
        errorMessage: 'Unknown Error.',
      );
    }
  }

  @override
  List<Object?> get props => [
        statusCode,
        statusMessage,
        success,
        errorMessage,
        data,
      ];
}
