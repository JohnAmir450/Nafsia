import 'package:nafsia/features/auth/logic/repos/models/user_model.dart';
import 'package:nafsia/features/home/domain/models/doctor_data_model.dart';

class ReviewModel {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int rating;
  final String comment;
  final String doctorId;
  final DoctorDataModel doctorData;
  final String userId;
  final UserDataModel userData;

  ReviewModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.rating,
    required this.comment,
    required this.doctorId,
    required this.doctorData,
    required this.userId,
    required this.userData,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['_id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      rating: json['rating'],
      comment: json['comment'],
      doctorId: json['doctorId'],
      doctorData: DoctorDataModel.fromJson(json['doctorData']),
      userId: json['userId'],
      userData: UserDataModel.fromJson(json['userData']),
    );
  }
}
