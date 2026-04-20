import 'package:equatable/equatable.dart';
import '../../data/model/patient_details_model.dart';

abstract class PatientDetailsState extends Equatable {
  const PatientDetailsState();

  @override
  List<Object?> get props => [];
}

class PatientDetailsInitial extends PatientDetailsState {}

class PatientDetailsLoading extends PatientDetailsState {}

class PatientDetailsSuccess extends PatientDetailsState {
  final List<PatientDetailsModel> patients;

  const PatientDetailsSuccess({required this.patients});

  @override
  List<Object?> get props => [patients];
}

class PatientDetailsError extends PatientDetailsState {
  final String message;

  const PatientDetailsError({required this.message});

  @override
  List<Object?> get props => [message];
}
