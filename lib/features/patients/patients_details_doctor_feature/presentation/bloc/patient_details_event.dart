import 'package:equatable/equatable.dart';

abstract class PatientDetailsEvent extends Equatable {
  const PatientDetailsEvent();

  @override
  List<Object?> get props => [];
}

class GetPatientDetailsEvent extends PatientDetailsEvent {}
