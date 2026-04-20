import 'package:dartz/dartz.dart';
import 'package:roshetta/core/services/local/cache_helper.dart';
import 'package:roshetta/core/services/remote/api_consumer.dart';
import 'package:roshetta/core/services/remote/endpoints.dart';
import 'package:roshetta/features/auth/data/model/login_request_model.dart';
import 'package:roshetta/features/auth/data/model/auth_response_model.dart';
import 'package:roshetta/features/auth/data/model/register_request_model.dart';
import 'package:roshetta/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiConsumer apiConsumer;
  final CacheHelper cacheHelper;

  AuthRepositoryImpl({required this.apiConsumer, required this.cacheHelper});

  @override
  Future<Either<String, AuthResponseModel>> login(LoginRequestModel request) async {
    final result = await apiConsumer.post<AuthResponseModel>(
      EndPoint.login,
      data: request.toJson(),
      fromJson: (json) => AuthResponseModel.fromJson(json),
    );

    return result.fold(
      (error) => Left(error),
      (loginResponse) async {
        await cacheHelper.saveData(key: ApiKey.id, value: loginResponse.id);
        await cacheHelper.saveData(key: ApiKey.email, value: loginResponse.email);
        await cacheHelper.saveData(key: ApiKey.name, value: loginResponse.name);
        await cacheHelper.saveData(key: ApiKey.accessToken, value: loginResponse.token);
        await cacheHelper.saveData(key: ApiKey.role, value: loginResponse.role);
        await cacheHelper.saveData(key: ApiKey.gender, value: loginResponse.gender);
        await cacheHelper.saveData(key: ApiKey.isLoggedIn, value: true);
        return Right(loginResponse);
      },
    );
  }

  @override
  Future<Either<String, AuthResponseModel>> register(RegisterRequestModel request, String role) async {
    final endpoint = role == 'patient' ? EndPoint.patientRegistration : EndPoint.doctorRegistration;

    final result = await apiConsumer.post<AuthResponseModel>(
      endpoint,
      data: request.toJson(),
      fromJson: (json) => AuthResponseModel.fromJson(json),
    );

    return result.fold(
      (error) => Left(error),
      (registerResponse) async {
        await cacheHelper.saveData(key: ApiKey.id, value: registerResponse.id);
        await cacheHelper.saveData(key: ApiKey.email, value: registerResponse.email);
        await cacheHelper.saveData(key: ApiKey.name, value: registerResponse.name);
        await cacheHelper.saveData(key: ApiKey.accessToken, value: registerResponse.token);
        await cacheHelper.saveData(key: ApiKey.role, value: registerResponse.role);
        await cacheHelper.saveData(key: ApiKey.gender, value: registerResponse.gender);
        await cacheHelper.saveData(key: ApiKey.isLoggedIn, value: true);
        return Right(registerResponse);
      },
    );
  }

  @override
  Future<void> logout() async {
    await cacheHelper.removeData(key: ApiKey.id);
    await cacheHelper.removeData(key: ApiKey.email);
    await cacheHelper.removeData(key: ApiKey.name);
    await cacheHelper.removeData(key: ApiKey.accessToken);
    await cacheHelper.removeData(key: ApiKey.role);
    await cacheHelper.removeData(key: ApiKey.gender);
    await cacheHelper.removeData(key: ApiKey.isLoggedIn);
  }

}
