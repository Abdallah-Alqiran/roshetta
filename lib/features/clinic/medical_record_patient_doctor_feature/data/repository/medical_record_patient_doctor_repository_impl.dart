
import 'package:roshetta/core/services/remote/api_consumer.dart';
import 'package:roshetta/features/clinic/medical_record_patient_doctor_feature/domain/repository/medical_record_patient_doctor_repository.dart';

class MedicalRecordPatientDoctorRepositoryImpl implements MedicalRecordPatientDoctorRepository {
  final ApiConsumer apiConsumer;
  MedicalRecordPatientDoctorRepositoryImpl({required this.apiConsumer});
  
}