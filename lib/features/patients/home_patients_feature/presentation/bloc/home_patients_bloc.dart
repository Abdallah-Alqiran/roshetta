import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roshetta/features/patients/home_patients_feature/domain/repository/home_repository.dart';
import 'package:roshetta/features/patients/home_patients_feature/presentation/bloc/home_patients_event.dart';
import 'package:roshetta/features/patients/home_patients_feature/presentation/bloc/home_patients_state.dart';

class HomePatientsBloc extends Bloc<HomePatientsEvent, HomePatientsState> {
  final HomeRepository homeRepository;

  HomePatientsBloc({required this.homeRepository})
      : super(HomePatientsInitial()) {
    on<GetDoctorsEvent>(_onGetDoctorsEvent);
  }

  void _onGetDoctorsEvent(
    GetDoctorsEvent event,
    Emitter<HomePatientsState> emit,
  ) async {
    emit(HomePatientsLoading());

    await homeRepository.getDoctors().then((result) {
      result.fold(
        (error) => emit(HomePatientsError(message: error)),
        (doctors) => emit(HomePatientsLoaded(doctors: doctors)),
      );
    });
  }
}
