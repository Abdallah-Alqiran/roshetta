import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'patients_details_doctor_event.dart';
part 'patients_details_doctor_state.dart';

class PatientsDetailsDoctorBloc extends Bloc<PatientsDetailsDoctorEvent, PatientsDetailsDoctorState> {
  PatientsDetailsDoctorBloc() : super(PatientsDetailsDoctorInitial()) {
    on<PatientsDetailsDoctorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
