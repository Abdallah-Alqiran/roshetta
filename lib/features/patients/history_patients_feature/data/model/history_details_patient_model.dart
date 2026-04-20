import 'package:json_annotation/json_annotation.dart';

part 'history_details_patient_model.g.dart';

@JsonSerializable()
class HistoryDetailsPatientModel {
  final String doctorName;
  final String doctorDepartment;
  final String date;
  final String status;

  HistoryDetailsPatientModel({
    required this.doctorName,
    required this.doctorDepartment,
    required this.date,
    required this.status,
  });

  factory HistoryDetailsPatientModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryDetailsPatientModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryDetailsPatientModelToJson(this);
}