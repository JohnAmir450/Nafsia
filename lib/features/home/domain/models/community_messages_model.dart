class CommunityMessageModel {
  final String id;
  final String sessionId;
  final String message;
  final DateTime createdAt;
  final DateTime updatedAt;

  CommunityMessageModel({
    required this.id,
    required this.sessionId,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CommunityMessageModel.fromJson(Map<String, dynamic> json) {
    return CommunityMessageModel(
      id: json['_id'] ?? '',
      sessionId: json['sessionId'] ?? '',
      message: json['message'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
