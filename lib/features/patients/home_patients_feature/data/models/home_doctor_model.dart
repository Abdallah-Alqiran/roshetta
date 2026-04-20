import 'package:json_annotation/json_annotation.dart';

part 'home_doctor_model.g.dart';

@JsonSerializable()
class HomeDoctorModel {
  final String userId;
  final String name;
  final String department;
  final String location;
  final double? price;
  final String info;
  final String phoneNumber;

  HomeDoctorModel({
    required this.userId,
    required this.name,
    required this.department,
    required this.location,
    this.price,
    required this.info,
    required this.phoneNumber,
  });

  factory HomeDoctorModel.fromJson(Map<String, dynamic> json) =>
      _$HomeDoctorModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDoctorModelToJson(this);
}
