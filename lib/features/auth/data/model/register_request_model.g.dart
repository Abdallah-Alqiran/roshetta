// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestModel _$RegisterRequestModelFromJson(
  Map<String, dynamic> json,
) => RegisterRequestModel(
  email: json['email'] as String,
  password: json['password'] as String,
  name: json['name'] as String,
  phoneNumber: json['phoneNumber'] as String,
  gender: json['gender'] as String,
  dateOfBirth: json['dateOfBirth'] as String,
);

Map<String, dynamic> _$RegisterRequestModelToJson(
  RegisterRequestModel instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'name': instance.name,
  'phoneNumber': instance.phoneNumber,
  'gender': instance.gender,
  'dateOfBirth': instance.dateOfBirth,
};
