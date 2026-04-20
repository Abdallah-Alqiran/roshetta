import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roshetta/features/patients/profile_patients_feature/domain/repositories/profile_patient_repository.dart';
import 'package:roshetta/features/patients/profile_patients_feature/presentation/bloc/profile_patient_event.dart';
import 'package:roshetta/features/patients/profile_patients_feature/presentation/bloc/profile_patient_state.dart';

class ProfilePatientBloc extends Bloc<ProfilePatientEvent, ProfilePatientState> {
  final ProfilePatientRepository profilePatientRepository;

  ProfilePatientBloc({required this.profilePatientRepository})
      : super(ProfilePatientInitial()) {
    on<GetProfilePatientEvent>(_onGetProfilePatientEvent);
  }

  void _onGetProfilePatientEvent(
    GetProfilePatientEvent event,
    Emitter<ProfilePatientState> emit,
  ) async {
    emit(ProfilePatientLoading());

    await profilePatientRepository.getPatientProfile().then((result) {
      result.fold(
        (error) => emit(ProfilePatientError(message: error)),
        (profile) => emit(ProfilePatientLoaded(profile: profile)),
      );
    });
  }
}
