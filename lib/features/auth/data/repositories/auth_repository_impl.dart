
import 'package:roshetta/core/services/local/cache_helper.dart';
import 'package:roshetta/core/services/remote/api_consumer.dart';
import 'package:roshetta/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiConsumer apiConsumer;
  final CacheHelper cacheHelper;

  AuthRepositoryImpl({required this.apiConsumer, required this.cacheHelper});

}
