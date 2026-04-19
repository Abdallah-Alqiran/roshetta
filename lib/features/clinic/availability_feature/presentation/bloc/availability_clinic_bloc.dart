import 'package:flutter_bloc/flutter_bloc.dart';
part 'availability_clinic_event.dart';
part 'availability_clinic_state.dart';

class AvailabilityClinicBloc extends Bloc<AvailabilityClinicEvent, AvailabilityClinicState> {
  AvailabilityClinicBloc() : super(AvailabilityClinicInitial()) {
    on<GetAvailabilityClinicScheduleEvent>(_onGetAvailabilityClinicScheduleEvent);
  }

  void _onGetAvailabilityClinicScheduleEvent(
    GetAvailabilityClinicScheduleEvent event,
    Emitter<AvailabilityClinicState> emit,
  ) {
    
  }
}
