import 'package:json_annotation/json_annotation.dart';

part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel {
  final String id;
  final String email;
  final String name;
  final String token;
  final String role;
  final String gender;
  final int expiresIn;

  AuthResponseModel({
    required this.id,
    required this.email,
    required this.name,
    required this.token,
    required this.role,
    required this.gender,
    required this.expiresIn,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);
}
