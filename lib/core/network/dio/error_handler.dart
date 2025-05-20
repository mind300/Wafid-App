import 'package:dio/dio.dart';

class ApiErrorModel {
  final String message;
  final int? code;

  ApiErrorModel({required this.message, this.code});
}

class ErrorHandler {
  static ApiErrorModel handle(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return ApiErrorModel(message: "Connection timed out", code: 408);

      case DioExceptionType.badResponse:
        final response = error.response;
        final message = response?.data['message'] ?? "Something went wrong";
        return ApiErrorModel(message: message, code: response?.statusCode);

      case DioExceptionType.cancel:
        return ApiErrorModel(message: "Request was cancelled", code: null);

      case DioExceptionType.connectionError:
        return ApiErrorModel(message: "No internet connection", code: null);

      case DioExceptionType.unknown:
      default:
        return ApiErrorModel(
          message: "Unexpected error occurred",
          code: null,
        );
    }
  }
}
