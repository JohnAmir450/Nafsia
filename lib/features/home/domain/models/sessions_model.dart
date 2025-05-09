import 'package:nafsia/features/home/domain/models/doctor_model.dart';

class SessionsModel {
  final String id;
  final String doctorId;
  final List<String> participations;
  final DateTime startAt;
  final int duration;
  final int price;
  final int seats;
  final int bookedSeats;
  final String type;
  final String? status;
  final String title;
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DoctorModel doctorData;
  final List<ParticipantData> participationsData;

  SessionsModel({
    required this.id,
    required this.doctorId,
    required this.participations,
    required this.startAt,
    required this.duration,
    required this.price,
    required this.title,
    required this.seats,
    required this.bookedSeats,
    required this.type,
    this.status,
    this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.doctorData,
    required this.participationsData,
  });

  factory SessionsModel.fromJson(Map<String, dynamic> json) {
    return SessionsModel(
      id: json['id'],
      doctorId: json['doctorId'],
      participations: List<String>.from(json['participations']),
      startAt: DateTime.parse(json['startAt']),
      duration: json['duration'],
      price: json['price'],
      seats: json['seats'],
      title: json['title'],
      bookedSeats: json['bookedSeats'],
      type: json['type'],
      status: json['status'],
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      doctorData: DoctorModel.fromJson(json['doctorData']),
      participationsData: (json['participationsData'] as List)
          .map((e) => ParticipantData.fromJson(e))
          .toList(),
    );
  }
}

class ParticipantData {
  final String avatar;
  final String id;
  final String name;

  ParticipantData({
    required this.avatar,
    required this.id,
    required this.name,
  });

  factory ParticipantData.fromJson(Map<String, dynamic> json) {
    return ParticipantData(
      avatar: json['avatar']??'',
      id: json['id'],
      name: json['name'],
    );
  }
}
