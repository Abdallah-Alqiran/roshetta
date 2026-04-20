part of 'doctor_details_patient_bloc.dart';

abstract class DoctorDetailsPatientState {}

class DoctorDetailsPatientInitial extends DoctorDetailsPatientState {}

class DoctorDetailsPatientLoading extends DoctorDetailsPatientState {}

class DoctorDetailsPatientSuccess extends DoctorDetailsPatientState {}

class DoctorDetailsPatientFailure extends DoctorDetailsPatientState {
  final String message;
  DoctorDetailsPatientFailure({required this.message});
}
