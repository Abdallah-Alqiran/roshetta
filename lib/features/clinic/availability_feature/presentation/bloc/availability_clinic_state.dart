part of 'availability_clinic_bloc.dart';

abstract class AvailabilityClinicState {}

class AvailabilityClinicInitial extends AvailabilityClinicState {}

class ChangeIndexAvailabilityClinicState extends AvailabilityClinicState {
  final int index;
  ChangeIndexAvailabilityClinicState({required this.index});
}