import 'package:dartz/dartz.dart';
import 'package:roshetta/features/patients/home_patients_feature/data/models/home_doctor_model.dart';

abstract class HomePatientsRepository {
  Future<Either<String, List<HomeDoctorModel>>> getHomeDoctors();
}
