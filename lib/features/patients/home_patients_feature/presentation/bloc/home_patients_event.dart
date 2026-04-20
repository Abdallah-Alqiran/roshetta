import 'package:equatable/equatable.dart';

abstract class HomePatientsEvent extends Equatable {
  const HomePatientsEvent();

  @override
  List<Object?> get props => [];
}

class GetDoctorsEvent extends HomePatientsEvent {}

class SearchDoctorsEvent extends HomePatientsEvent {
  final String? name;
  final String? specialization;

  const SearchDoctorsEvent({this.name, this.specialization});

  @override
  List<Object?> get props => [name, specialization];
}
