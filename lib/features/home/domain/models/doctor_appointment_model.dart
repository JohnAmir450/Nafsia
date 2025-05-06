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
  final String startAtHour;
  final int duration;
  final int price;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DoctorData doctorData;

  AppointmentModel({
    required this.id,
    required this.doctorId,
    required this.day,
    required this.startAtHour,
    required this.duration,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.doctorData,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['_id'],
      doctorId: json['doctorId'],
      day: json['day'],
      startAtHour: json['startAtHour'],
      duration: json['duration'],
      price: json['price'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      doctorData: DoctorData.fromJson(json['doctorData']),
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
