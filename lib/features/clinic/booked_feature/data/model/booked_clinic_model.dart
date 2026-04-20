import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booked_clinic_model.g.dart';

@JsonSerializable()
class BookedClinicModel extends Equatable {
  final int id;
  final String date;
  final String name;
  final String phoneNumber;
  final String status;

  const BookedClinicModel({
    required this.id,
    required this.date,
    required this.name,
    required this.phoneNumber,
    required this.status,
  });

  factory BookedClinicModel.fromJson(Map<String, dynamic> json) =>
      _$BookedClinicModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookedClinicModelToJson(this);

  @override
  List<Object?> get props => [id, date, name, phoneNumber, status];
}
