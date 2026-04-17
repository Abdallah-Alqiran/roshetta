import 'package:dio/dio.dart';
import 'package:roshetta/core/services/local/cache_helper.dart';
import 'package:roshetta/core/services/remote/endpoints.dart';

class ApiInterceptor extends Interceptor {
  final CacheHelper _cacheHelper = CacheHelper();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
      final token = _cacheHelper.getData(key: ApiKey.accessToken);
      if (token != null) {
        options.headers[ApiKey.authorization] = 'Bearer $token';
      }
    super.onRequest(options, handler);
  }
}
