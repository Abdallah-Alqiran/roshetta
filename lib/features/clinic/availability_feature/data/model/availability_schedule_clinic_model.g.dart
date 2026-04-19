// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availability_schedule_clinic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailabilityScheduleClinicModel _$AvailabilityScheduleClinicModelFromJson(
  Map<String, dynamic> json,
) => AvailabilityScheduleClinicModel(
  scheduleId: (json['scheduleId'] as num).toInt(),
  day: json['day'] as String,
  startTime: json['startTime'] as String,
  endTime: json['endTime'] as String,
  isVacation: json['isVacation'] as bool,
  averageConsultationTime: (json['averageConsultationTime'] as num).toInt(),
  maxVisits: (json['maxVisits'] as num).toInt(),
);

Map<String, dynamic> _$AvailabilityScheduleClinicModelToJson(
  AvailabilityScheduleClinicModel instance,
) => <String, dynamic>{
  'scheduleId': instance.scheduleId,
  'day': instance.day,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'isVacation': instance.isVacation,
  'averageConsultationTime': instance.averageConsultationTime,
  'maxVisits': instance.maxVisits,
};
