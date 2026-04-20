import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roshetta/core/utils/api_error_handler.dart';
import 'package:roshetta/features/patients/doctor_details_patient_feature/data/models/book_doctor_model.dart';
import 'package:roshetta/features/patients/doctor_details_patient_feature/domain/repositories/doctor_detials_patient_repo.dart';

part 'doctor_details_patient_event.dart';
part 'doctor_details_patient_state.dart';

class DoctorDetailsPatientBloc
    extends Bloc<DoctorDetailsPatientEvent, DoctorDetailsPatientState> {
  final DoctorDetailsPatientRepo doctorDetailsPatientRepo;

  DoctorDetailsPatientBloc({required this.doctorDetailsPatientRepo})
      : super(DoctorDetailsPatientInitial()) {
    on<BookDoctorEvent>(_onBookDoctor);
  }

  Future<void> _onBookDoctor(
    BookDoctorEvent event,
    Emitter<DoctorDetailsPatientState> emit,
  ) async {
    emit(DoctorDetailsPatientLoading());

    final result = await doctorDetailsPatientRepo.bookDoctor(
      BookDoctorModel(date: event.date, doctorId: event.doctorId),
    );

    result.fold(
      (error) {
        final errorResponse = ApiErrorHandler.handle(error);
        emit(DoctorDetailsPatientFailure(message: errorResponse.message));
      },
      (_) {
        emit(DoctorDetailsPatientSuccess());
      },
    );
  }
}
