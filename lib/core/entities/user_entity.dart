

class UserEntity {
  final String name;
  final String secondName;
  final String phoneNumber;
  final String email;
  final String uId;
  
   int? points;

  UserEntity(
      {required this.name,
      required this.secondName,
      required this.phoneNumber,
      required this.email,
      required this.uId,
      
      this.points
     });

       UserEntity copyWith({
    String? name,
    String? secondName,
    String? phoneNumber,
    String? email,
    String? uId,
   
     int? points,
  }) {
    return UserEntity(
      name: name ?? this.name,
      secondName: secondName ?? this.secondName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      uId: uId ?? this.uId,

      points: points ?? this.points
    );
  }
}
