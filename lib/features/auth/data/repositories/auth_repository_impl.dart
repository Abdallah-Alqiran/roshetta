import 'package:dartz/dartz.dart';
import 'package:roshetta/core/services/local/cache_helper.dart';
import 'package:roshetta/core/services/remote/api_consumer.dart';
import 'package:roshetta/core/services/remote/endpoints.dart';
import 'package:roshetta/features/auth/data/model/login_request_model.dart';
import 'package:roshetta/features/auth/data/model/login_response_model.dart';
import 'package:roshetta/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiConsumer apiConsumer;
  final CacheHelper cacheHelper;

  AuthRepositoryImpl({required this.apiConsumer, required this.cacheHelper});

  @override
  Future<Either<String, LoginResponseModel>> login(LoginRequestModel request) async {
    final result = await apiConsumer.post<LoginResponseModel>(
      EndPoint.login,
      data: request.toJson(),
      fromJson: (json) => LoginResponseModel.fromJson(json),
    );

    return result.fold(
      (error) => Left(error),
      (loginResponse) async {
        await cacheHelper.saveData(key: 'id', value: loginResponse.id);
        await cacheHelper.saveData(key: 'email', value: loginResponse.email);
        await cacheHelper.saveData(key: 'name', value: loginResponse.name);
        await cacheHelper.saveData(key: 'token', value: loginResponse.token);
        await cacheHelper.saveData(key: 'role', value: loginResponse.role);
        await cacheHelper.saveData(key: 'gender', value: loginResponse.gender);
        await cacheHelper.saveData(key: 'isLoggedIn', value: true);
        return Right(loginResponse);
      },
    );
  }

}
