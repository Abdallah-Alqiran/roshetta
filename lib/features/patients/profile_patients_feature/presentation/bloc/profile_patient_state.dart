import 'package:equatable/equatable.dart';
import 'package:roshetta/features/patients/profile_patients_feature/data/models/patient_profile_model.dart';

abstract class ProfilePatientState extends Equatable {
  const ProfilePatientState();

  @override
  List<Object?> get props => [];
}

class ProfilePatientInitial extends ProfilePatientState {}

class ProfilePatientLoading extends ProfilePatientState {}

class ProfilePatientLoaded extends ProfilePatientState {
  final PatientProfileModel profile;

  const ProfilePatientLoaded({required this.profile});

  @override
  List<Object?> get props => [profile];
}

class ProfilePatientError extends ProfilePatientState {
  final String message;

  const ProfilePatientError({required this.message});

  @override
  List<Object?> get props => [message];
}
