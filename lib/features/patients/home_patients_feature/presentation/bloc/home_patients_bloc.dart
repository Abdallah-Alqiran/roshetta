import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roshetta/features/patients/home_patients_feature/domain/repository/home_repository.dart';
import 'package:roshetta/features/patients/home_patients_feature/presentation/bloc/home_patients_event.dart';
import 'package:roshetta/features/patients/home_patients_feature/presentation/bloc/home_patients_state.dart';
import 'package:roshetta/features/patients/home_patients_feature/data/models/home_doctor_model.dart';

class HomePatientsBloc extends Bloc<HomePatientsEvent, HomePatientsState> {
  final HomeRepository homeRepository;
  List<HomeDoctorModel> _allDoctors = [];

  HomePatientsBloc({required this.homeRepository})
      : super(HomePatientsInitial()) {
    on<GetDoctorsEvent>(_onGetDoctorsEvent);
    on<SearchDoctorsEvent>(_onSearchDoctorsEvent);
  }

  void _onGetDoctorsEvent(
    GetDoctorsEvent event,
    Emitter<HomePatientsState> emit,
  ) async {
    emit(HomePatientsLoading());

    final result = await homeRepository.getDoctors();
    result.fold(
      (error) => emit(HomePatientsError(message: error)),
      (doctors) {
        _allDoctors = doctors;
        emit(HomePatientsLoaded(doctors: doctors));
      },
    );
  }

  void _onSearchDoctorsEvent(
    SearchDoctorsEvent event,
    Emitter<HomePatientsState> emit,
  ) {
    if (_allDoctors.isEmpty && state is! HomePatientsLoaded) return;

    emit(HomePatientsLoading());

    final filteredDoctors = _allDoctors.where((doctor) {
      final matchesName = event.name == null ||
          event.name!.isEmpty ||
          doctor.name.toLowerCase().contains(event.name!.toLowerCase());
      final matchesSpecialization = event.specialization == null ||
          event.specialization!.isEmpty ||
          doctor.department == event.specialization;
      return matchesName && matchesSpecialization;
    }).toList();

    emit(HomePatientsLoaded(doctors: filteredDoctors));
  }
}
