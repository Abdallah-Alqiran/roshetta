import 'package:dartz/dartz.dart';
import 'package:roshetta/core/services/remote/api_consumer.dart';
import 'package:roshetta/core/services/remote/endpoints.dart';
import 'package:roshetta/features/clinic/availability_feature/data/model/availability_schedule_clinic_model.dart';
import 'package:roshetta/features/clinic/availability_feature/domain/repository/availability_clinic_repository.dart';

class AvailabilityClinicRepositoryImpl implements AvailabilityClinicRepository {
  final ApiConsumer apiConsumer;
  AvailabilityClinicRepositoryImpl({required this.apiConsumer});
  
  @override
  Future<Either<String, List<AvailabilityScheduleClinicModel>>> getAvailabilityClinicSchedule() async {
    final result = await apiConsumer.getRaw<List<AvailabilityScheduleClinicModel>>(
      EndPoint.clinicAvailabilitySchedule,
      fromJson: (json) {
        if (json is List) {
          final list = json as List;
          return list.map((item) {
            return AvailabilityScheduleClinicModel.fromJson(item as Map<String, dynamic>);
          }).toList();
        } else if (json is Map<String, dynamic>) {
          final data = json['data'];
          if (data is List) {
            return data.map((item) => AvailabilityScheduleClinicModel.fromJson(item as Map<String, dynamic>)).toList();
          }
          throw Exception("Expected 'data' key to contain a list");
        } else {
          throw Exception("Expected List or Map");
        }
      },
    );

    return result.fold(
      (error) => Left(error),
      (availabilitySchedule) => Right(availabilitySchedule),
    );
  }
  
  @override
  Future<Either<String, List<AvailabilityScheduleClinicModel>>> updateAvailabilityClinicSchedule(List<AvailabilityScheduleClinicModel> availabilitySchedules) async {
    final result = await apiConsumer.put<List<AvailabilityScheduleClinicModel>>(
      EndPoint.clinicAvailabilitySchedule,
      data: availabilitySchedules.map((schedule) => schedule.toJson()).toList(),
      fromJson: (json) {
        final list = json as List;
        return list.map((item) => AvailabilityScheduleClinicModel.fromJson(item as Map<String, dynamic>)).toList();
      },
    );

    return result.fold(
      (error) => Left(error),
      (updatedSchedule) => Right(updatedSchedule),
    );
  }
}