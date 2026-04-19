part of 'availability_clinic_bloc.dart';

abstract class AvailabilityClinicState {}

class AvailabilityClinicInitial extends AvailabilityClinicState {}

class AvailabilityClinicLoading extends AvailabilityClinicState {}

class AvailabilityClinicLoaded extends AvailabilityClinicState {
  final List<AvailabilityScheduleClinicModel> availabilitySchedule;

  AvailabilityClinicLoaded({required this.availabilitySchedule});
}

class AvailabilityClinicError extends AvailabilityClinicState {
  final String message;

  AvailabilityClinicError({required this.message});
}
