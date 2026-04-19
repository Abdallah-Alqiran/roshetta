// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) =>
    AuthResponseModel(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      token: json['token'] as String,
      role: json['role'] as String,
      gender: json['gender'] as String,
      expiresIn: (json['expiresIn'] as num).toInt(),
    );

Map<String, dynamic> _$AuthResponseModelToJson(AuthResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'token': instance.token,
      'role': instance.role,
      'gender': instance.gender,
      'expiresIn': instance.expiresIn,
    };
