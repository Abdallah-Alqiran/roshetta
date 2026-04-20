
import 'package:roshetta/features/clinic/availability_feature/data/model/availability_schedule_clinic_model.dart';

abstract class AvailabilityClinicEvent {}

class GetAvailabilityClinicScheduleEvent extends AvailabilityClinicEvent {}

class UpdateAvailabilityClinicScheduleEvent extends AvailabilityClinicEvent {
  final List<AvailabilityScheduleClinicModel> availabilitySchedules;

  UpdateAvailabilityClinicScheduleEvent({required this.availabilitySchedules});
}
