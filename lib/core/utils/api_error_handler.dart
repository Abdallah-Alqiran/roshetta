import 'dart:convert';

enum ErrorType {
  validation,    
  unauthorized,  
  conflict,    
  forbidden,     
  server,        
  general,       
}

class ApiErrorResponse {
  final String message;
  final Map<String, List<String>>? fieldErrors;
  final ErrorType type;
  
  ApiErrorResponse({
    required this.message,
    this.fieldErrors,
    required this.type,
  });
}

class ApiErrorHandler {
  static ApiErrorResponse handle(dynamic error) {
    try {
      final errorString = error.toString();
      final decoded = errorString.contains('{') 
          ? jsonDecode(errorString) 
          : null;
      
      if (decoded != null && decoded is Map<String, dynamic>) {
        final status = decoded['status'];
        
       
        if (status == 400 && decoded['errors'] is Map) {
          final fieldErrors = (decoded['errors'] as Map).map(
            (key, value) => MapEntry(
              key as String,
              List<String>.from(value as List),
            ),
          );
          return ApiErrorResponse(
            message: decoded['title'] ?? 'Validation error',
            fieldErrors: fieldErrors,
            type: ErrorType.validation,
          );
        }
        
        if (status == 401) {
          final errors = decoded['errors'];
          if (errors is List && errors.isNotEmpty) {
            return ApiErrorResponse(
              message: errors.last.toString(),
              type: ErrorType.unauthorized,
            );
          }
          return ApiErrorResponse(
            message: 'Invalid email or password',
            type: ErrorType.unauthorized,
          );
        }
        
        if (status == 409) {
          return ApiErrorResponse(
            message: decoded['message'] ?? decoded['title'] ?? 'Email already exists',
            type: ErrorType.conflict,
          );
        }
        
        if (status == 403) {
          return ApiErrorResponse(
            message: decoded['message'] ?? decoded['title'] ?? 'Access denied',
            type: ErrorType.forbidden,
          );
        }
        
        if (status == 500) {
          return ApiErrorResponse(
            message: 'Server error, please try again later',
            type: ErrorType.server,
          );
        }
        
        if (decoded['errors'] is List) {
          return ApiErrorResponse(
            message: (decoded['errors'] as List).join('\n'),
            type: ErrorType.general,
          );
        }
        
        if (decoded['message'] != null) {
          return ApiErrorResponse(
            message: decoded['message'],
            type: ErrorType.general,
          );
        }
      }
      
      return ApiErrorResponse(
        message: error.toString(),
        type: ErrorType.general,
      );
    } catch (_) {
      return ApiErrorResponse(
        message: error.toString(),
        type: ErrorType.general,
      );
    }
  }
}