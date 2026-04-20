import 'package:dartz/dartz.dart';
import 'package:roshetta/core/services/remote/api_consumer.dart';
import 'package:roshetta/core/services/remote/endpoints.dart';
import 'package:roshetta/features/patients/doctor_details_patient_feature/data/models/book_doctor_model.dart';
import 'package:roshetta/features/patients/doctor_details_patient_feature/domain/repositories/doctor_detials_patient_repo.dart';

class DoctorDetailsPatientRepoImpl implements DoctorDetailsPatientRepo {
  final ApiConsumer apiConsumer;

  DoctorDetailsPatientRepoImpl({required this.apiConsumer});

  @override
  Future<Either<String, void>> bookDoctor(BookDoctorModel bookDoctorModel) async {
    final result = await apiConsumer.post<dynamic>(
      EndPoint.clinicBooked,
      data: bookDoctorModel.toJson(),
    );

    return result.fold(
      (error) => Left(error),
      (_) => const Right(null),
    );
  }
}
