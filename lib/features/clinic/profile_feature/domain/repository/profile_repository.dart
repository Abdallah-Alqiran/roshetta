import 'package:dartz/dartz.dart';
import 'package:roshetta/features/clinic/profile_feature/data/model/profile_clinic_model.dart';

abstract class ProfileRepository {
  Future<Either<String, ProfileClinicModel>> getDoctorProfile();

  Future<Either<String, Unit>> updateDoctorProfile(ProfileClinicModel profile);
}