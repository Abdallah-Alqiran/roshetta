import 'package:json_annotation/json_annotation.dart';

part 'patient_profile_model.g.dart';

@JsonSerializable()
class PatientProfileModel {
  final String userId;
  final String name;
  final String phoneNumber;
  final String dateOfBirth;
  final String gender;

  PatientProfileModel({
    required this.userId,
    required this.name,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.gender,
  });

  factory PatientProfileModel.fromJson(Map<String, dynamic> json) =>
      _$PatientProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientProfileModelToJson(this);
}
