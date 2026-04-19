part of 'availability_clinic_bloc.dart';

abstract class AvailabilityClinicEvent {}

class GetAvailabilityClinicScheduleEvent extends AvailabilityClinicEvent {}

class UpdateAvailabilityClinicScheduleEvent extends AvailabilityClinicEvent {
  final List<AvailabilityScheduleClinicModel> availabilitySchedules;

  UpdateAvailabilityClinicScheduleEvent({required this.availabilitySchedules});
}
