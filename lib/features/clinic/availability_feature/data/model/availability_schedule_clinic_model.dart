
class AvailabilityScheduleClinicModel {
  final String day;
  final String startTime;
  final String endTime;
  final String isVacation;
  final String averageConsultationTime;
  final String maxVisits;

  AvailabilityScheduleClinicModel({
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.isVacation,
    required this.averageConsultationTime,
    required this.maxVisits,
  });
}