import 'package:equatable/equatable.dart';
import 'package:roshetta/features/clinic/booked_feature/data/model/booked_clinic_model.dart';

abstract class BookedClinicState extends Equatable {
  const BookedClinicState();

  @override
  List<Object> get props => [];
}

class BookedClinicInitial extends BookedClinicState {}

class BookedClinicLoading extends BookedClinicState {}

class BookedClinicLoaded extends BookedClinicState {
  final List<BookedClinicModel> bookedAppointments;

  const BookedClinicLoaded({required this.bookedAppointments});

  @override
  List<Object> get props => [bookedAppointments];
}

class BookedClinicError extends BookedClinicState {
  final String message;

  const BookedClinicError({required this.message});

  @override
  List<Object> get props => [message];
}
