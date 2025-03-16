import 'package:firebase_auth/firebase_auth.dart';
import 'package:nafsia/core/entities/user_entity.dart';


class UserModel {
  final String name;
  final String secondName;
   String phoneNumber;
  final String email;
  final String uId;
  
  final int points;

  UserModel(
     {
    required this.name,
    required this.email,
    required this.uId,
 
    required this.phoneNumber, 
    required this.secondName,
   
   required this.points,
  });

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      name: user.displayName ?? '',
      phoneNumber: user.phoneNumber ?? '',
      secondName: user.displayName?.split(' ')[1]??'',
      email: user.email ?? '',
      uId: user.uid,
    
      points: 0
    );
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        secondName: json['secondName'],
        phoneNumber: json['phoneNumber'],
        points: json['points'],
        email: json['email'],
        uId: json['uId'],
      
        );
  }

  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(

      name: userEntity.name,
      secondName: userEntity.secondName,
      phoneNumber: userEntity.phoneNumber,
      points: userEntity.points??0,
      email: userEntity.email,
      uId: userEntity.uId,
     
    
    );
  }

  toMap() {
    return {
      'name': name,
      'secondName': secondName,
      'phoneNumber': phoneNumber,
      'email': email,
      'uId': uId,
      'points': points,
      
      
    };
  }

  UserEntity toEntity() {
    return UserEntity(
        name: name,
        secondName: secondName,
        phoneNumber: phoneNumber,
        email: email,
        uId: uId,
        points: points,
      
    );
      
  } 
  
   UserModel copyWith({
    String? name,
    String? secondName,
    String? phoneNumber,
    String? email,
    String? uId,
   
    int? points,
  }) {
    return UserModel(
      name: name ?? this.name,
      secondName: secondName ?? this.secondName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      points: points ?? this.points,
      uId: uId ?? this.uId,
    
    );
  }
}
