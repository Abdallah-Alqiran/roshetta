import 'package:dartz/dartz.dart';
import 'package:roshetta/core/services/remote/api_consumer.dart';
import 'package:roshetta/core/services/remote/endpoints.dart';
import 'package:roshetta/features/patients/home_patients_feature/data/models/home_doctor_model.dart';
import 'package:roshetta/features/patients/home_patients_feature/domain/repositories/home_patients_repository.dart';

class HomePatientsRepositoryImpl implements HomePatientsRepository {
  final ApiConsumer apiConsumer;

  HomePatientsRepositoryImpl({required this.apiConsumer});

  @override
  Future<Either<String, List<HomeDoctorModel>>> getHomeDoctors() async {
    final result = await apiConsumer.getRaw<List<HomeDoctorModel>>(
      EndPoint.homePatient,
      fromJson: (json) {
        if (json is List) {
          return json.map((e) => HomeDoctorModel.fromJson(e)).toList();
        } else if (json is Map<String, dynamic> && json['data'] is List) {
          return (json['data'] as List).map((e) => HomeDoctorModel.fromJson(e)).toList();
        } else {
          throw Exception("Expected a list of doctors");
        }
      },
    );

    return result.fold(
      (error) => Left(error),
      (doctors) => Right(doctors),
    );
  }
}
