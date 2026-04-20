import 'package:equatable/equatable.dart';

class HomeDoctorModel extends Equatable {
  final String userId;
  final String name;
  final String department;
  final String location;
  final double? price;
  final String info;
  final String phoneNumber;

  const HomeDoctorModel({
    required this.userId,
    required this.name,
    required this.department,
    required this.location,
    this.price,
    required this.info,
    required this.phoneNumber,
  });

  factory HomeDoctorModel.fromJson(Map<String, dynamic> json) {
    return HomeDoctorModel(
      userId: json['userId'] as String? ?? '',
      name: json['name'] as String? ?? '',
      department: json['department'] as String? ?? '',
      location: json['location'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble(),
      info: json['info'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'name': name,
        'department': department,
        'location': location,
        'price': price,
        'info': info,
        'phoneNumber': phoneNumber,
      };

  @override
  List<Object?> get props =>
      [userId, name, department, location, price, info, phoneNumber];
}
