import 'package:equatable/equatable.dart';

abstract class BookedClinicEvent extends Equatable {
  const BookedClinicEvent();

  @override
  List<Object> get props => [];
}

class GetBookedClinicEvent extends BookedClinicEvent {}

class UpdateBookedClinicStatusEvent extends BookedClinicEvent {
  final int id;
  final String status;

  const UpdateBookedClinicStatusEvent({required this.id, required this.status});

  @override
  List<Object> get props => [id, status];
}
