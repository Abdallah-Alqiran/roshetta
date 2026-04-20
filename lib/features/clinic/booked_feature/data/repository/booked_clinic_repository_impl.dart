import 'package:dartz/dartz.dart';
import 'package:roshetta/core/services/remote/api_consumer.dart';
import 'package:roshetta/core/services/remote/endpoints.dart';
import 'package:roshetta/features/clinic/booked_feature/data/model/booked_clinic_model.dart';
import 'package:roshetta/features/clinic/booked_feature/domain/repository/booked_clinic_repository.dart';

class BookedClinicRepositoryImpl implements BookedClinicRepository {
  final ApiConsumer apiConsumer;
  BookedClinicRepositoryImpl({required this.apiConsumer});

  @override
  Future<Either<String, List<BookedClinicModel>>> getBookedClinic() async {
    final result = await apiConsumer.getRaw<List<BookedClinicModel>>(
      EndPoint.clinicBooked,
      fromJson: (json) {
        if (json is List) {
          final list = json as List;
          return list.map((item) {
            return BookedClinicModel.fromJson(item as Map<String, dynamic>);
          }).toList();
        } else if (json is Map<String, dynamic>) {
          final data = json['data'];
          if (data is List) {
            return data
                .map(
                  (item) =>
                      BookedClinicModel.fromJson(item as Map<String, dynamic>),
                )
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
      (bookedAppointments) => Right(bookedAppointments),
    );
  }
}
