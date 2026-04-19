part of 'patients_details_doctor_bloc.dart';

sealed class PatientsDetailsDoctorState extends Equatable {
  const PatientsDetailsDoctorState();
  
  @override
  List<Object> get props => [];
}

final class PatientsDetailsDoctorInitial extends PatientsDetailsDoctorState {}
