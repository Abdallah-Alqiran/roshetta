import 'package:dartz/dartz.dart';
import 'package:roshetta/core/services/remote/api_consumer.dart';
import 'package:roshetta/core/services/remote/endpoints.dart';
import 'package:roshetta/features/clinic/profile_feature/data/model/profile_clinic_model.dart';
import 'package:roshetta/features/clinic/profile_feature/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ApiConsumer apiConsumer;

  ProfileRepositoryImpl({required this.apiConsumer});

  @override
  Future<Either<String, ProfileClinicModel>> getDoctorProfile() async {
    final result = await apiConsumer.getRaw<ProfileClinicModel>(
      EndPoint.profileDoctor,
      fromJson: (json) {
        if (json is Map<String, dynamic>) {
          final data = json['data'];
          if (data is Map<String, dynamic>) {
            return ProfileClinicModel.fromJson(data);
          }
          return ProfileClinicModel.fromJson(json);
        } else {
          throw Exception("Expected Map<String, dynamic>");
        }
      },
    );

    return result.fold(
      (error) => Left(error),
      (profile) => Right(profile),
    );
  }

  @override
  Future<Either<String, Unit>> updateDoctorProfile(
      ProfileClinicModel profile) async {
    final result = await apiConsumer.put<ProfileClinicModel>(
      EndPoint.profileDoctor,
      data: profile.toJson(),
    );

    return result.fold(
      (error) => Left(error),
      (_) => Right(unit),
    );
  }
}