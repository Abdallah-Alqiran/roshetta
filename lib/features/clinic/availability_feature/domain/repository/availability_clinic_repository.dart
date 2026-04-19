import 'package:dartz/dartz.dart';
import 'package:roshetta/features/clinic/availability_feature/data/model/availability_schedule_clinic_model.dart';

abstract class AvailabilityClinicRepository {
  Future<Either<String, List<AvailabilityScheduleClinicModel>>> getAvailabilityClinicSchedule();
}