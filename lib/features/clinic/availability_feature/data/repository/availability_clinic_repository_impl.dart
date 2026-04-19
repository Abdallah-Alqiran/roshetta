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
    final result = await apiConsumer.post<List<AvailabilityScheduleClinicModel>>(
      EndPoint.clinicAvailabilitySchedule,
      fromJson: (json) {
        final list = json as List;
        return list.map((item) => AvailabilityScheduleClinicModel.fromJson(item as Map<String, dynamic>)).toList();
      },
    );

    return result.fold(
      (error) => Left(error),
      (availabilitySchedule) => Right(availabilitySchedule),
    );
  }

}