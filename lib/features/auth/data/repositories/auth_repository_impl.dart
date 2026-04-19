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
        await cacheHelper.saveData(key: 'id', value: registerResponse.id);
        await cacheHelper.saveData(key: 'email', value: registerResponse.email);
        await cacheHelper.saveData(key: 'name', value: registerResponse.name);
        await cacheHelper.saveData(key: 'token', value: registerResponse.token);
        await cacheHelper.saveData(key: 'role', value: registerResponse.role);
        await cacheHelper.saveData(key: 'gender', value: registerResponse.gender);
        await cacheHelper.saveData(key: 'isLoggedIn', value: true);
        return Right(registerResponse);
      },
    );
  }

}
