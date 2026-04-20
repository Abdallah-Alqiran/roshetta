import 'package:dartz/dartz.dart';

import 'package:roshetta/core/services/remote/api_consumer.dart';
import 'package:roshetta/core/services/remote/endpoints.dart';
import '../model/patient_details_model.dart';
import '../../domain/repository/patient_details_repository.dart';

class PatientDetailsRepositoryImpl implements PatientDetailsRepository {
  final ApiConsumer apiConsumer;

  PatientDetailsRepositoryImpl({required this.apiConsumer});

  @override
  Future<Either<String, List<PatientDetailsModel>>> getPatientsData() async {
    final result = await apiConsumer.getRaw<List<PatientDetailsModel>>(
      EndPoint.doctorPatientsData,
      fromJson: (json) {
        if (json is List) {
          return json
              .map(
                (item) =>
                    PatientDetailsModel.fromJson(item as Map<String, dynamic>),
              )
              .toList();
        } else if (json is Map<String, dynamic>) {
          final data = json['data'];
          if (data is List) {
            return data
                .map(
                  (item) => PatientDetailsModel.fromJson(
                    item as Map<String, dynamic>,
                  ),
                )
                .toList();
          }
          throw Exception("Expected 'data' key to contain a list");
        } else {
          throw Exception("Expected List or Map");
        }
      },
    );

    return result.fold((error) => Left(error), (patients) => Right(patients));
  }
}
