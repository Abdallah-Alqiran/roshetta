import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roshetta/features/patients/home_patients_feature/domain/repository/home_repository.dart';
import 'package:roshetta/features/patients/home_patients_feature/presentation/bloc/home_patients_event.dart';
import 'package:roshetta/features/patients/home_patients_feature/presentation/bloc/home_patients_state.dart';

class HomePatientsBloc extends Bloc<HomePatientsEvent, HomePatientsState> {
  final HomeRepository homeRepository;

  HomePatientsBloc({required this.homeRepository})
      : super(HomePatientsInitial()) {
    on<GetHomeDoctorsEvent>(_onGetHomeDoctorsEvent);
    on<SearchDoctorsEvent>(_onSearchDoctorsEvent);
  }

  void _onGetHomeDoctorsEvent(
    GetHomeDoctorsEvent event,
    Emitter<HomePatientsState> emit,
  ) async {
    emit(HomePatientsLoading());

    final result = await homeRepository.getDoctors();
    result.fold(
      (error) => emit(HomePatientsError(message: error)),
      (doctors) => emit(HomePatientsLoaded(doctors: doctors)),
    );
  }

  void _onSearchDoctorsEvent(
    SearchDoctorsEvent event,
    Emitter<HomePatientsState> emit,
  ) async {
    emit(HomePatientsLoading());

    // For now, we'll fetch all and filter client-side if the API doesn't support filtering
    // Or if the repository supports filtering, we use it.
    // Assuming we fetch all and filter for now as a fallback or if repo is simple.
    
    final result = await homeRepository.getDoctors();
    result.fold(
      (error) => emit(HomePatientsError(message: error)),
      (doctors) {
        var filteredList = doctors;
        
        if (event.name != null && event.name!.isNotEmpty) {
          filteredList = filteredList
              .where((doc) => doc.name.toLowerCase().contains(event.name!.toLowerCase()))
              .toList();
        }
        
        if (event.specialization != null && event.specialization!.isNotEmpty) {
          filteredList = filteredList
              .where((doc) => doc.department.toLowerCase() == event.specialization!.toLowerCase())
              .toList();
        }
        
        emit(HomePatientsLoaded(doctors: filteredList));
      },
    );
  }
}
