import 'package:dartz/dartz.dart';
import 'package:roshetta/features/patients/doctor_details_patient_feature/data/models/book_doctor_model.dart';

abstract class DoctorDetailsPatientRepo {
  Future<Either<String, void>> bookDoctor(BookDoctorModel bookDoctorModel);
}