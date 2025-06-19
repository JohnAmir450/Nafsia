import 'package:nafsia/core/helper_functions/get_dummy_doctor.dart';
import 'package:nafsia/features/home/domain/models/sessions_model.dart';

SessionsModel getDummyMyPrivateSessions(){

  return SessionsModel(
    doctorId: '1',
    id: 'das',
    bookedSeats: 20,
    doctorData: getDummyDoctor(),
    duration: 30,
    participations: List.empty(),
    participationsData: List.empty(),
    price: 300,seats: 30,
    title: 'title',
    description: 'description',
    startAt: DateTime.now(),
    
    type: 'private',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    status: 'active'
  );
}