part of 'doctors_cubit.dart';

@immutable
sealed class DoctorsState {}

final class DoctorsInitialState extends DoctorsState {}

final class GetAllDoctorsLoadingState extends DoctorsState {}

final class GetAllDoctorsFailureState extends DoctorsState {
  final String errorMessage;
  GetAllDoctorsFailureState({required this.errorMessage});
}

final class GetAllDoctorsSuccessState extends DoctorsState {
  final List<DoctorModel> doctors;
  GetAllDoctorsSuccessState({required this.doctors});
}

final class GetDoctorAppointmentsLoadingState extends DoctorsState {}

final class GetDoctorAppointmentsFailureState extends DoctorsState {
  final String errorMessage;
  GetDoctorAppointmentsFailureState({required this.errorMessage});
}

final class GetDoctorAppointmentsSuccessState extends DoctorsState {
  final List<AppointmentModel> appointments;
  GetDoctorAppointmentsSuccessState({required this.appointments});
}

final class SearchDoctorsLoadingState extends DoctorsState {}

final class SearchDoctorsFailureState extends DoctorsState {
  final String errorMessage;
  SearchDoctorsFailureState({required this.errorMessage});
}

final class GetDoctorReviewsSuccessState extends DoctorsState {
  final List<ReviewModel> reviews;
  GetDoctorReviewsSuccessState({required this.reviews});
}

final class GetDoctorReviewsFailureState extends DoctorsState {
  final String errorMessage;
  GetDoctorReviewsFailureState({required this.errorMessage});
}

final class GetDoctorReviewsLoadingState extends DoctorsState {}

final class BookPrivateSessionAppointmentLoadingState extends DoctorsState {}

final class BookPrivateSessionAppointmentSuccessState extends DoctorsState {}

final class BookPrivateSessionAppointmentFailureState extends DoctorsState {
  final String errorMessage;
  BookPrivateSessionAppointmentFailureState({required this.errorMessage});
}

final class GetBookedPrivateSessionsLoadingState extends DoctorsState {}


final class GetBookedPrivateSessionsSuccessState extends DoctorsState {
  final List<SessionsModel> appointments;

  GetBookedPrivateSessionsSuccessState({required this.appointments});
}


final class GetBookedPrivateSessionsFailureState extends DoctorsState {
  final String errorMessage;
  GetBookedPrivateSessionsFailureState({required this.errorMessage});
}

