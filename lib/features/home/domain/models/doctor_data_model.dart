class DoctorDataModel {
  final String id;
  final String? name;
  final String avatarUrl;
  final String? specialization;
  //final String? description;
  final int? rate;
  final int? balance;

  DoctorDataModel({
    required this.id,
     this.name,
    required this.avatarUrl,
    this.specialization,
    this.rate,
    this.balance,
  });

  factory DoctorDataModel.fromJson(Map<String, dynamic> json) {
    return DoctorDataModel(
      id: json['_id'],
      name: json['name']??'',
      avatarUrl: json['avatar'] is Map
          ? json['avatar']['secure_url'] ?? 'default.png'
          : json['avatar'] ?? 'default.png',
      specialization: json['specialization']??'',
      rate: json['rate'] ?? 0,
      balance: json['balance'] ?? 0,
    );
  }
}
