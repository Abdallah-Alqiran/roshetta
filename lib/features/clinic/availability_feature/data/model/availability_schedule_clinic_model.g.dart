// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availability_schedule_clinic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailabilityScheduleClinicModel _$AvailabilityScheduleClinicModelFromJson(
  Map<String, dynamic> json,
) => AvailabilityScheduleClinicModel(
  day: json['day'] as String,
  startTime: json['startTime'] as String,
  endTime: json['endTime'] as String,
  isVacation: json['isVacation'] as String,
  averageConsultationTime: json['averageConsultationTime'] as String,
  maxVisits: json['maxVisits'] as String,
);

Map<String, dynamic> _$AvailabilityScheduleClinicModelToJson(
  AvailabilityScheduleClinicModel instance,
) => <String, dynamic>{
  'day': instance.day,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'isVacation': instance.isVacation,
  'averageConsultationTime': instance.averageConsultationTime,
  'maxVisits': instance.maxVisits,
};
