import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final String id;
  final String email;
  final String name;
  final String token;
  final String role;
  final String gender;
  final int expiresIn;

  LoginResponseModel({
    required this.id,
    required this.email,
    required this.name,
    required this.token,
    required this.role,
    required this.gender,
    required this.expiresIn,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
