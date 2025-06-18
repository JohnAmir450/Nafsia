import 'package:nafsia/core/helper_functions/get_dummy_doctor.dart';
import 'package:nafsia/core/models/reveiew_model.dart';
import 'package:nafsia/features/auth/logic/repos/models/user_model.dart';

ReviewModel getDummyDoctorReview() {
  return ReviewModel(
    id: "123456789",
    userId: "123456789",
    doctorId: "123456789",
    rating: 4,
    updatedAt: DateTime(2000),
    comment: "kmlkmlkmlmlkmasldmsalkdmalsmdklsamlkm",
    createdAt: DateTime(2000),
    doctorData: getDummyDoctorData(),
    userData: UserDataModel(
      age: 10,
      
      email: '3WUoI@example.com',
      gender: 'male',
      id: '1',
      isVerified: false,
      name: 'Ahmed',
      phone: '0123456789',
      role: 'user',
      createdAt: DateTime(2000),
      updatedAt: DateTime(2000),
    ),
  );
}