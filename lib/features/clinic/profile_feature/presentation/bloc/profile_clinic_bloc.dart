import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roshetta/features/clinic/profile_feature/domain/repository/profile_repository.dart';
import 'package:roshetta/features/clinic/profile_feature/presentation/bloc/profile_clinic_event.dart';
import 'package:roshetta/features/clinic/profile_feature/presentation/bloc/profile_clinic_state.dart';

class ProfileClinicBloc extends Bloc<ProfileClinicEvent, ProfileClinicState> {
  final ProfileRepository profileRepository;

  ProfileClinicBloc({required this.profileRepository})
      : super(ProfileClinicInitial()) {
    on<GetProfileClinicEvent>(
      _onGetProfileClinicEvent,
    );
    on<UpdateProfileClinicEvent>(
      _onUpdateProfileClinicEvent,
    );
  }

  void _onGetProfileClinicEvent(
    GetProfileClinicEvent event,
    Emitter<ProfileClinicState> emit,
  ) async {
    emit(ProfileClinicLoading());

    await profileRepository.getDoctorProfile().then((
      result,
    ) {
      result.fold(
        (error) => emit(ProfileClinicError(message: error)),
        (profile) => emit(
          ProfileClinicLoaded(profile: profile),
        ),
      );
    });
  }

  void _onUpdateProfileClinicEvent(
    UpdateProfileClinicEvent event,
    Emitter<ProfileClinicState> emit,
  ) async {
    emit(ProfileClinicLoading());

    await profileRepository.updateDoctorProfile(event.profile).then((result) {
      result.fold(
        (error) {
          if (error == "Unexpected response format") {
            add(GetProfileClinicEvent());
          } else {
            emit(ProfileClinicError(message: error));
          }
        },
        (_) => add(GetProfileClinicEvent()),
      );
    });
  }
}