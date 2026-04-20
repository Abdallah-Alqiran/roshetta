import 'package:dartz/dartz.dart';
import 'package:roshetta/features/patients/profile_patients_feature/data/models/patient_profile_model.dart';

abstract class ProfilePatientRepository {
  Future<Either<String, PatientProfileModel>> getPatientProfile();
}
