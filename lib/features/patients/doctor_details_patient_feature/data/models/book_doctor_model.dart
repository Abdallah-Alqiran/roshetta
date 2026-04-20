import 'package:json_annotation/json_annotation.dart';

part 'book_doctor_model.g.dart';

@JsonSerializable()
class BookDoctorModel {
  
  final String date;
  final String doctorId;

  BookDoctorModel({
    required this.date,
    required this.doctorId,
  });

  factory BookDoctorModel.fromJson(Map<String, dynamic> json) =>
      _$BookDoctorModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookDoctorModelToJson(this);
}
