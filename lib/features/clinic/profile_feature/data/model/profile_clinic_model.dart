import 'package:json_annotation/json_annotation.dart';

part 'profile_clinic_model.g.dart';

@JsonSerializable()
class ProfileClinicModel {
  final String doctorId;
  final String name;
  final String info;
  final String department;
  final String location;
  final String phoneNumber;
  final double? price;
  final String dateOfBirth;

  ProfileClinicModel({
    required this.doctorId,
    required this.name,
    required this.info,
    required this.department,
    required this.location,
    required this.phoneNumber,
    this.price,
    required this.dateOfBirth,
  });

  factory ProfileClinicModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileClinicModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileClinicModelToJson(this);
}