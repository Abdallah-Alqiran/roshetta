import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roshetta/features/clinic/booked_feature/domain/repository/booked_clinic_repository.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/bloc/booked_clinic_event.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/bloc/booked_clinic_state.dart';

class BookedClinicBloc extends Bloc<BookedClinicEvent, BookedClinicState> {
  final BookedClinicRepository bookedClinicRepository;

  BookedClinicBloc({required this.bookedClinicRepository})
    : super(BookedClinicInitial()) {
    on<GetBookedClinicEvent>(_onGetBookedClinicEvent);
  }

  void _onGetBookedClinicEvent(
    GetBookedClinicEvent event,
    Emitter<BookedClinicState> emit,
  ) async {
    emit(BookedClinicLoading());

    await bookedClinicRepository.getBookedClinic().then((result) {
      result.fold(
        (error) => emit(BookedClinicError(message: error)),
        (bookedAppointments) =>
            emit(BookedClinicLoaded(bookedAppointments: bookedAppointments)),
      );
    });
  }
}
