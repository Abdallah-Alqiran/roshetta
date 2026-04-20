import 'package:equatable/equatable.dart';
import 'package:roshetta/features/clinic/profile_feature/data/model/profile_clinic_model.dart';

abstract class ProfileClinicState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileClinicInitial extends ProfileClinicState {
  @override
  List<Object?> get props => [];
}

class ProfileClinicLoading extends ProfileClinicState {
  @override
  List<Object?> get props => [];
}

class ProfileClinicLoaded extends ProfileClinicState {
  final ProfileClinicModel profile;
  final DateTime timestamp;

  ProfileClinicLoaded({
    required this.profile,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  @override
  List<Object?> get props => [profile, timestamp];
}

class ProfileClinicError extends ProfileClinicState {
  final String message;

  ProfileClinicError({required this.message});

  @override
  List<Object?> get props => [message];
}