import 'package:json_annotation/json_annotation.dart';

part 'availability_schedule_clinic_model.g.dart';

@JsonSerializable()
class AvailabilityScheduleClinicModel {
  final int scheduleId;
  final String day;
  final String startTime;
  final String endTime;
  final bool isVacation;
  final int averageConsultationTime;
  final int maxVisits;

  AvailabilityScheduleClinicModel({
    required this.scheduleId,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.isVacation,
    required this.averageConsultationTime,
    required this.maxVisits,
  });

    factory AvailabilityScheduleClinicModel.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityScheduleClinicModelFromJson(json);

  Map<String, dynamic> toJson() => _$AvailabilityScheduleClinicModelToJson(this);
}