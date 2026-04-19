import 'package:dio/dio.dart';
import 'package:roshetta/core/errors/error_model.dart';

class DioExceptionHandler {
  static String handleException(DioException e) {
    
    if (e.response != null) {
      
      try {
        final errorModel = ErrorModel.fromJson(
          e.response?.data ?? {},
        );
        
        final serverMessage = errorModel.message;
        
        switch (e.response?.statusCode) {
          case 400:
            return serverMessage.isNotEmpty ? serverMessage : 'Bad request';
          case 401:
            return serverMessage.isNotEmpty ? serverMessage : 'Unauthorized';
          case 403:
            return serverMessage.isNotEmpty ? serverMessage : 'Forbidden';
          case 404:
            return serverMessage.isNotEmpty ? serverMessage : 'Not found';
          case 409:
            return serverMessage.isNotEmpty ? serverMessage : 'Conflict';
          case 422:
            return serverMessage.isNotEmpty ? serverMessage : 'Validation error';
          case 500:
            return 'Server error, please try again later';
          case 502:
          case 503:
            return 'Service unavailable, please try again later';
          default:
            return serverMessage.isNotEmpty ? serverMessage : 'Server error (${e.response?.statusCode})';
        }
      } catch (err) {
        
        try {
          if (e.response?.data is Map) {
            final data = e.response?.data as Map;
            if (data.containsKey('message')) {
              return data['message'].toString();
            }
          }
        } catch (_) {}
        
        return 'Server error (${e.response?.statusCode})';
      }
    }
    
    switch (e.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
        return 'No internet connection. Please check your network.';
        
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return 'Server is taking too long to respond. Please try again.';
        
      case DioExceptionType.cancel:
        return 'Request was cancelled';
        
      case DioExceptionType.badCertificate:
        return 'Security certificate error';
        
      case DioExceptionType.badResponse:
        return 'Unexpected response from server';
        
      default:
        return 'Network error: ${e.message}';
    }
  }
}