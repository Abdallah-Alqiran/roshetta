import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repository/patient_details_repository.dart';
import 'patient_details_event.dart';
import 'patient_details_state.dart';

class PatientDetailsBloc extends Bloc<PatientDetailsEvent, PatientDetailsState> {
  final PatientDetailsRepository repository;

  PatientDetailsBloc({required this.repository}) : super(PatientDetailsInitial()) {
    on<GetPatientDetailsEvent>((event, emit) async {
      emit(PatientDetailsLoading());
      final result = await repository.getPatientsData();
      result.fold(
        (error) => emit(PatientDetailsError(message: error)),
        (patients) => emit(PatientDetailsSuccess(patients: patients)),
      );
    });
  }
}
