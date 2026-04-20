// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientProfileModel _$PatientProfileModelFromJson(Map<String, dynamic> json) =>
    PatientProfileModel(
      userId: json['userId'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$PatientProfileModelToJson(
  PatientProfileModel instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'name': instance.name,
  'phoneNumber': instance.phoneNumber,
  'dateOfBirth': instance.dateOfBirth,
  'gender': instance.gender,
};
