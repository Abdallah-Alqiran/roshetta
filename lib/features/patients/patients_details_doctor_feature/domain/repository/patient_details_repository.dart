import 'package:dartz/dartz.dart';
import '../../data/model/patient_details_model.dart';

abstract class PatientDetailsRepository {
  Future<Either<String, List<PatientDetailsModel>>> getPatientsData();
}
