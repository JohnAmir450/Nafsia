class MeasurementModel {
  final String id;
  final String createdAt;
  final String updatedAt;
  final String userId;
  final String occupation;
  final String gender;
  final String bmiCategory;
  final int age;
  final int sleepQuality;
  final int heartRate;
  final int dailySteps;
  final int systolicBp;
  final int diastolicBp;
  final int stressLevel;

  MeasurementModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.occupation,
    required this.gender,
    required this.bmiCategory,
    required this.age,
    required this.sleepQuality,
    required this.heartRate,
    required this.dailySteps,
    required this.systolicBp,
    required this.diastolicBp,
    required this.stressLevel,
  });

  factory MeasurementModel.fromJson(Map<String, dynamic> json) {
    return MeasurementModel(
      id: json['_id'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      userId: json['userId'] ?? '',
      occupation: json['occupation'] ?? '',
      gender: json['gender'] ?? '',
      bmiCategory: json['bmi_category'] ?? '',
      age: json['age'] ?? 0,
      sleepQuality: json['sleep_quality'] ?? 0,
      heartRate: json['heart_rate'] ?? 0,
      dailySteps: json['daily_steps'] ?? 0,
      systolicBp: json['systolic_bp'] ?? 0,
      diastolicBp: json['diastolic_bp'] ?? 0,
      stressLevel: json['stress_level'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'userId': userId,
      'occupation': occupation,
      'gender': gender,
      'bmi_category': bmiCategory,
      'age': age,
      'sleep_quality': sleepQuality,
      'heart_rate': heartRate,
      'daily_steps': dailySteps,
      'systolic_bp': systolicBp,
      'diastolic_bp': diastolicBp,
      'stress_level': stressLevel,
    };
  }
}
