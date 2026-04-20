import 'package:equatable/equatable.dart';
import 'package:roshetta/features/clinic/availability_feature/data/model/availability_schedule_clinic_model.dart';


abstract class AvailabilityClinicState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AvailabilityClinicInitial extends AvailabilityClinicState {
  @override
  List<Object?> get props => [];
}

class AvailabilityClinicLoading extends AvailabilityClinicState {
  @override
  List<Object?> get props => [];
}

class AvailabilityClinicLoaded extends AvailabilityClinicState {
  final List<AvailabilityScheduleClinicModel> availabilitySchedule;
  final DateTime timestamp;

  AvailabilityClinicLoaded({
    required this.availabilitySchedule,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  @override
  List<Object?> get props => [availabilitySchedule, timestamp];
}

class AvailabilityClinicError extends AvailabilityClinicState {
  final String message;

  AvailabilityClinicError({required this.message});

  @override
  List<Object?> get props => [message];
}
