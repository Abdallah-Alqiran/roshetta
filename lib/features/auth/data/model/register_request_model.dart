
import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterRequestModel {
  final String email;
  final String password;
  final String name;
  final String phoneNumber;
  final String gender;
  final String dateOfBirth;

  RegisterRequestModel({
    required this.email,
    required this.password,
    required this.name,
    required this.phoneNumber,
    required this.gender,
    required this.dateOfBirth,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}
