// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_clinic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileClinicModel _$ProfileClinicModelFromJson(Map<String, dynamic> json) =>
    ProfileClinicModel(
      doctorId: json['doctorId'] as String,
      name: json['name'] as String,
      info: json['info'] as String,
      department: json['department'] as String,
      location: json['location'] as String,
      phoneNumber: json['phoneNumber'] as String,
      price: (json['price'] as num?)?.toDouble(),
      dateOfBirth: json['dateOfBirth'] as String,
    );

Map<String, dynamic> _$ProfileClinicModelToJson(ProfileClinicModel instance) =>
    <String, dynamic>{
      'doctorId': instance.doctorId,
      'name': instance.name,
      'info': instance.info,
      'department': instance.department,
      'location': instance.location,
      'phoneNumber': instance.phoneNumber,
      'price': instance.price,
      'dateOfBirth': instance.dateOfBirth,
    };
