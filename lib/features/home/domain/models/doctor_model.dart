import 'package:nafsia/features/home/domain/models/doctor_data_model.dart';

class DoctorModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String role;
  final int age;
  final String gender;
  final bool isVerified;
  final String? avatarUrl;
  final String createdAt;
  
  final DoctorDataModel? doctorData;

  DoctorModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.age,
    required this.gender,
    required this.isVerified,
    this.avatarUrl,
    this.doctorData,
    required this.createdAt
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    final avatar = json['avatar'];
    return DoctorModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      createdAt: json['createdAt'],
      role: json['role'],
      age: json['age'],
      gender: json['gender'],
      isVerified: json['isVerified'],
      avatarUrl: avatar is Map<String, dynamic> ? avatar['secure_url'] : avatar?.toString()??'',
      doctorData: json['doctorData'] != null ? DoctorDataModel.fromJson(json['doctorData']) : null,
    );
  }
}
