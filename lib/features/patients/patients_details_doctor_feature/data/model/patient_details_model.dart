import 'package:equatable/equatable.dart';

class PatientDetailsModel extends Equatable {
  final String name;
  final String dateOfBirth;
  final int gender;
  final String date;
  final String phoneNumber;
  final String email;

  const PatientDetailsModel({
    required this.name,
    required this.dateOfBirth,
    required this.gender,
    required this.date,
    required this.phoneNumber,
    required this.email,
  });

  factory PatientDetailsModel.fromJson(Map<String, dynamic> json) {
    return PatientDetailsModel(
      name: json['name'] as String? ?? '',
      dateOfBirth: json['dateOfBirth'] as String? ?? '',
      gender: json['gender'] as int? ?? 0,
      date: json['date'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'dateOfBirth': dateOfBirth,
        'gender': gender,
        'date': date,
        'phoneNumber': phoneNumber,
        'email': email,
      };

  @override
  List<Object?> get props =>
      [name, dateOfBirth, gender, date, phoneNumber, email];
}
