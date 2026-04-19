import 'package:json_annotation/json_annotation.dart';

part 'availability_schedule_clinic_model.g.dart';

@JsonSerializable()
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

    factory AvailabilityScheduleClinicModel.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityScheduleClinicModelFromJson(json);

  Map<String, dynamic> toJson() => _$AvailabilityScheduleClinicModelToJson(this);
}