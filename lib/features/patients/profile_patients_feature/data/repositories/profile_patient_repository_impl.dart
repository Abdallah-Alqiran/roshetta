import 'package:dartz/dartz.dart';
import 'package:roshetta/core/services/remote/api_consumer.dart';
import 'package:roshetta/core/services/remote/endpoints.dart';
import 'package:roshetta/features/patients/profile_patients_feature/data/models/patient_profile_model.dart';
import 'package:roshetta/features/patients/profile_patients_feature/domain/repositories/profile_patient_repository.dart';

class ProfilePatientRepositoryImpl implements ProfilePatientRepository {
  final ApiConsumer apiConsumer;

  ProfilePatientRepositoryImpl({required this.apiConsumer});

  @override
  Future<Either<String, PatientProfileModel>> getPatientProfile() async {
    final result = await apiConsumer.getRaw<PatientProfileModel>(
      EndPoint.profilePatient,
      fromJson: (json) {
        if (json is Map<String, dynamic>) {
          return PatientProfileModel.fromJson(json);
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
}
