import 'package:nafsia/features/home/domain/models/doctor_model.dart';

class AppointmentsResponse {
  final bool success;
  final String message;
  final List<AppointmentModel> data;

  AppointmentsResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory AppointmentsResponse.fromJson(Map<String, dynamic> json) {
    return AppointmentsResponse(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List?)
              ?.map((x) => AppointmentModel.fromJson(x))
              .toList() ??
          [],
    );
  }
}

class AppointmentModel {
  final String id;
  final String doctorId;
  final String day;
  
  final int duration;
  final List<ScheduleItem> schedule;
  final int price;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DoctorModel doctorModel;

  AppointmentModel({
    required this.id,
    required this.doctorId,
    required this.day,
    
    required this.duration,
    required this.price,
    required this.schedule,
    required this.createdAt,
    required this.updatedAt,
    required this.doctorModel,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['_id'],
      doctorId: json['doctorId'],
      day: json['day'],
      
      duration: json['duration'],
      schedule: (json['schedule'] as List)
          .map((x) => ScheduleItem.fromJson(x))
          .toList(),
      price: json['price'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      doctorModel: DoctorModel.fromJson(json['doctorData']),
    );
  }
}

class ScheduleItem {
  final String id;
  final String startAt;
  final bool isBooked;
  final String? sessionId;

  ScheduleItem({
    required this.id,
    required this.startAt,
    required this.isBooked,
    this.sessionId,
  });

  factory ScheduleItem.fromJson(Map<String, dynamic> json) {
    return ScheduleItem(
      id: json['_id'],
      startAt: json['startAt'],
      isBooked: json['isBooked'],
      sessionId: json['sessionId'],
    );
  }
}

class DoctorData {
  final String id;
  final String name;
  final Avatar avatar;

  DoctorData({
    required this.id,
    required this.name,
    required this.avatar,
  });

  factory DoctorData.fromJson(Map<String, dynamic> json) {
    return DoctorData(
      id: json['_id'],
      name: json['name'],
      avatar: Avatar.fromJson(json['avatar']),
    );
  }
}

class Avatar {
  final String secureUrl;
  final String publicId;

  Avatar({
    required this.secureUrl,
    required this.publicId,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) {
    return Avatar(
      secureUrl: json['secure_url'],
      publicId: json['public_id'],
    );
  }
}
