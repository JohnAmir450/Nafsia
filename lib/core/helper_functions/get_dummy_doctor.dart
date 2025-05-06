import 'package:nafsia/features/home/domain/models/doctor_data_model.dart';
import 'package:nafsia/features/home/domain/models/doctor_model.dart';

DoctorModel getDummyDoctor() {
  return DoctorModel(
      id: "1",
      name: "Dr. Ahmed",
      age: 33,
      doctorData: DoctorDataModel(
        id: '234534534534534',
        avatarUrl:
            'https://img.freepik.com/free-vector/man-shows-gesture-great-idea_10045-637.jpg?t=st=1746547552~exp=1746551152~hmac=5e83ad2d2dcd1105ec90c4a9d3abc20e401cc12b4e14dc5b2e1b523583807bf3&w=826',
        specialization: 'specialization',
      ),
      email: '3WUoI@example.com',
      phone: '0123456789',
      gender: 'male',
      createdAt: '2023-01-01',
      isVerified: false,
      role: 'doctor',
      avatarUrl:
          'https://img.freepik.com/free-vector/man-shows-gesture-great-idea_10045-637.jpg?t=st=1746547552~exp=1746551152~hmac=5e83ad2d2dcd1105ec90c4a9d3abc20e401cc12b4e14dc5b2e1b523583807bf3&w=826');
}
