// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booked_clinic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookedClinicModel _$BookedClinicModelFromJson(Map<String, dynamic> json) =>
    BookedClinicModel(
      id: (json['id'] as num).toInt(),
      date: json['date'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$BookedClinicModelToJson(BookedClinicModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'status': instance.status,
    };
