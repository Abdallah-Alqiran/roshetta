import 'package:equatable/equatable.dart';

abstract class HomePatientsEvent extends Equatable {
  const HomePatientsEvent();

  @override
  List<Object?> get props => [];
}

class GetHomeDoctorsEvent extends HomePatientsEvent {}
