import 'package:roshetta/core/services/remote/endpoints.dart';

class ErrorModel {
  final String message;

  ErrorModel({required this.message});
  
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    String? message;

    if (jsonData.containsKey(ApiKey.message)) {
      message = jsonData[ApiKey.message]?.toString();
    } else if (jsonData.containsKey('detail')) {
      message = jsonData['detail']?.toString();
    } else if (jsonData.containsKey('error')) {
      message = jsonData['error']?.toString();
    } else if (jsonData.containsKey('errors')) {
      final errors = jsonData['errors'];
      if (errors is String) {
        message = errors;
      } else if (errors is List) {
        message = errors.length > 1 ? errors[1].toString() : errors.first.toString();
      } else if (errors is Map) {
        message = errors.values
            .expand((value) => value is List ? value : [value])
            .map((item) => item.toString())
            .join('\n');
      }
    }

    return ErrorModel(
      message: message?.isNotEmpty == true ? message! : 'Unknown error',
    );
  }
}