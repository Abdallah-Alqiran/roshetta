import 'package:equatable/equatable.dart';

abstract class BookedClinicEvent extends Equatable {
  const BookedClinicEvent();

  @override
  List<Object> get props => [];
}

class GetBookedClinicEvent extends BookedClinicEvent {}
