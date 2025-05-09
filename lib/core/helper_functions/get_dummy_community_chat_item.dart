import 'package:nafsia/core/helper_functions/get_dummy_doctor.dart';
import 'package:nafsia/features/home/domain/models/sessions_model.dart';

SessionsModel getDummyCommunitySessions() {
  return SessionsModel(
      bookedSeats: 30,
      createdAt: DateTime(2000),
      doctorData: getDummyDoctor(),
      doctorId: '1234568',
      duration: 30,
      id: '1234568',
      price: 30,
      title: 'title',
      participations: [],
      participationsData: [],
      seats: 50,
      startAt: DateTime(2000),
      type: 'private',
      updatedAt: DateTime(2000),
      status: 'active');
}
