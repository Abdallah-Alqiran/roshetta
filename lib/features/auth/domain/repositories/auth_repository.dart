import 'package:dartz/dartz.dart';
import 'package:roshetta/features/auth/data/model/login_request_model.dart';
import 'package:roshetta/features/auth/data/model/auth_response_model.dart';
import 'package:roshetta/features/auth/data/model/register_request_model.dart';

abstract class AuthRepository {
  Future<Either<String, AuthResponseModel>> login(LoginRequestModel request);
  Future<Either<String, AuthResponseModel>> register(RegisterRequestModel request, String role);
}

