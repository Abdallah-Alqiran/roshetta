import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roshetta/features/patients/home_patients_feature/domain/repositories/home_patients_repository.dart';
import 'package:roshetta/features/patients/home_patients_feature/presentation/bloc/home_patients_event.dart';
import 'package:roshetta/features/patients/home_patients_feature/presentation/bloc/home_patients_state.dart';

class HomePatientsBloc extends Bloc<HomePatientsEvent, HomePatientsState> {
  final HomePatientsRepository homePatientsRepository;

  HomePatientsBloc({required this.homePatientsRepository})
      : super(HomePatientsInitial()) {
    on<GetHomeDoctorsEvent>(_onGetHomeDoctorsEvent);
  }

  void _onGetHomeDoctorsEvent(
    GetHomeDoctorsEvent event,
    Emitter<HomePatientsState> emit,
  ) async {
    emit(HomePatientsLoading());

    await homePatientsRepository.getHomeDoctors().then((result) {
      result.fold(
        (error) => emit(HomePatientsError(message: error)),
        (doctors) => emit(HomePatientsLoaded(doctors: doctors)),
      );
    });
  }
}
