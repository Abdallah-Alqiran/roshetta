// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_details_patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryDetailsPatientModel _$HistoryDetailsPatientModelFromJson(
  Map<String, dynamic> json,
) => HistoryDetailsPatientModel(
  doctorName: json['doctorName'] as String,
  doctorDepartment: json['doctorDepartment'] as String,
  date: json['date'] as String,
  status: json['status'] as String,
);

Map<String, dynamic> _$HistoryDetailsPatientModelToJson(
  HistoryDetailsPatientModel instance,
) => <String, dynamic>{
  'doctorName': instance.doctorName,
  'doctorDepartment': instance.doctorDepartment,
  'date': instance.date,
  'status': instance.status,
};
