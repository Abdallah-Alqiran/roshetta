// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDoctorModel _$HomeDoctorModelFromJson(Map<String, dynamic> json) =>
    HomeDoctorModel(
      userId: json['userId'] as String,
      name: json['name'] as String,
      department: json['department'] as String,
      location: json['location'] as String,
      price: (json['price'] as num?)?.toDouble(),
      info: json['info'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$HomeDoctorModelToJson(HomeDoctorModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'department': instance.department,
      'location': instance.location,
      'price': instance.price,
      'info': instance.info,
      'phoneNumber': instance.phoneNumber,
    };
