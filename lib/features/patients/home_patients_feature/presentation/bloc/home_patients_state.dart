import 'package:equatable/equatable.dart';
import 'package:roshetta/features/patients/home_patients_feature/data/models/home_doctor_model.dart';

abstract class HomePatientsState extends Equatable {
  const HomePatientsState();

  @override
  List<Object> get props => [];
}

class HomePatientsInitial extends HomePatientsState {}

class HomePatientsLoading extends HomePatientsState {}

class HomePatientsLoaded extends HomePatientsState {
  final List<HomeDoctorModel> doctors;

  const HomePatientsLoaded({required this.doctors});

  @override
  List<Object> get props => [doctors];
}

class HomePatientsError extends HomePatientsState {
  final String message;

  const HomePatientsError({required this.message});

  @override
  List<Object> get props => [message];
}
