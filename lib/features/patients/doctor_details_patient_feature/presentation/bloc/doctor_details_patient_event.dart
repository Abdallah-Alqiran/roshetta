part of 'doctor_details_patient_bloc.dart';

abstract class DoctorDetailsPatientEvent {}

class BookDoctorEvent extends DoctorDetailsPatientEvent {
  final String date;
  final String doctorId;

  BookDoctorEvent({required this.date, required this.doctorId});
}
