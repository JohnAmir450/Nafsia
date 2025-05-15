import 'package:nafsia/core/helper_functions/get_dummy_doctor.dart';
import 'package:nafsia/features/home/domain/models/doctor_appointment_model.dart';

AppointmentModel getDummyAppointment() {
  return AppointmentModel(
    id: '123456789',
    doctorId: '123456789',
    day: '2025-04-20T20:50:13.034Z',
    duration: 30,
    price: 150,
    schedule: [
      ScheduleItem(
        sessionId: '123456789',
        id: '123456789',
        startAt: "05:30",
        isBooked: false,
      ),
    ],
    createdAt: DateTime(2000),
    updatedAt: DateTime(2000),
    doctorModel: getDummyDoctor(),
  );
}
