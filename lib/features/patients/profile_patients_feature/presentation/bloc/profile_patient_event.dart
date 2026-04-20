import 'package:equatable/equatable.dart';

abstract class ProfilePatientEvent extends Equatable {
  const ProfilePatientEvent();

  @override
  List<Object?> get props => [];
}

class GetProfilePatientEvent extends ProfilePatientEvent {}
