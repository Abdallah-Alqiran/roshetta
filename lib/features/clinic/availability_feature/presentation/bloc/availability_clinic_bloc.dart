
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roshetta/features/clinic/availability_feature/data/model/availability_schedule_clinic_model.dart';
import 'package:roshetta/features/clinic/availability_feature/domain/repository/availability_clinic_repository.dart';
part 'availability_clinic_event.dart';
part 'availability_clinic_state.dart';

class AvailabilityClinicBloc extends Bloc<AvailabilityClinicEvent, AvailabilityClinicState> {
  final AvailabilityClinicRepository availabilityClinicRepository;
  
  AvailabilityClinicBloc({required this.availabilityClinicRepository}) : super(AvailabilityClinicInitial()) {
    on<GetAvailabilityClinicScheduleEvent>(_onGetAvailabilityClinicScheduleEvent);
    on<UpdateAvailabilityClinicScheduleEvent>(_onUpdateAvailabilityClinicScheduleEvent);
  }

  void _onGetAvailabilityClinicScheduleEvent(
    GetAvailabilityClinicScheduleEvent event,
    Emitter<AvailabilityClinicState> emit,
  ) async {
    emit(AvailabilityClinicLoading());

    await availabilityClinicRepository.getAvailabilityClinicSchedule().then((result) {
      result.fold(
        (error) => emit(AvailabilityClinicError(message: error)),
        (availabilitySchedule) => emit(AvailabilityClinicLoaded(availabilitySchedule: availabilitySchedule)),
      );
    });
  }

  void _onUpdateAvailabilityClinicScheduleEvent(
    UpdateAvailabilityClinicScheduleEvent event,
    Emitter<AvailabilityClinicState> emit,
  ) async {
    emit(AvailabilityClinicLoading());

    await availabilityClinicRepository.updateAvailabilityClinicSchedule(event.availabilitySchedules).then((result) {
      result.fold(
        (error) => emit(AvailabilityClinicError(message: error)),
        (updatedSchedule) => emit(AvailabilityClinicLoaded(availabilitySchedule: updatedSchedule)),
      );
    });
  }
}
