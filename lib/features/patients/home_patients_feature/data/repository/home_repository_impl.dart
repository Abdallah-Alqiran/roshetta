import 'package:dartz/dartz.dart';
import 'package:roshetta/core/services/remote/api_consumer.dart';
import 'package:roshetta/core/services/remote/endpoints.dart';
import 'package:roshetta/features/patients/home_patients_feature/data/models/home_doctor_model.dart';
import 'package:roshetta/features/patients/home_patients_feature/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final ApiConsumer apiConsumer;
  HomeRepositoryImpl({required this.apiConsumer});

  @override
  Future<Either<String, List<HomeDoctorModel>>> getDoctors() async {
    final result = await apiConsumer.getRaw<List<HomeDoctorModel>>(
      EndPoint.home,
      fromJson: (json) {
        if (json is List) {
          return json
              .map((item) =>
                  HomeDoctorModel.fromJson(item as Map<String, dynamic>))
              .toList();
        } else if (json is Map<String, dynamic>) {
          final data = json['data'];
          if (data is List) {
            return data
                .map((item) =>
                    HomeDoctorModel.fromJson(item as Map<String, dynamic>))
                .toList();
          }
          throw Exception("Expected 'data' key to contain a list");
        } else {
          throw Exception("Expected List or Map");
        }
      },
    );

    return result.fold(
      (error) => Left(error),
      (doctors) => Right(doctors),
    );
  }
}
