import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nafsia/core/models/reveiew_model.dart';
import 'package:nafsia/features/home/domain/models/doctor_appointment_model.dart';
import 'package:nafsia/features/home/domain/models/doctor_model.dart';
import 'package:nafsia/features/home/domain/models/sessions_model.dart';
import 'package:nafsia/features/home/domain/repos/home_repo.dart';

part 'doctors_state.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  final HomeRepo homeRepo;
  DoctorsCubit(this.homeRepo) : super(DoctorsInitialState());

  Future<void> getAllDoctors() async {
    emit(GetAllDoctorsLoadingState());
    final result = await homeRepo.getAllDoctors();
    result.fold(
      (failure) =>
          emit(GetAllDoctorsFailureState(errorMessage: failure.message)),
      (doctors) {
        emit(GetAllDoctorsSuccessState(doctors: doctors));
      },
    );
  }
  Future<void>searchDoctors({required String doctorName}) async {
    emit(SearchDoctorsLoadingState());
    final result = await homeRepo.searchDoctors(doctorName: doctorName);
    result.fold(
      (failure) =>
          emit(SearchDoctorsFailureState(errorMessage: failure.message)),
      (doctors) {
        emit(GetAllDoctorsSuccessState(doctors: doctors));
      },
    );
  }
  Future<void> getDoctorAppointments({required String doctorId}) async {
    emit(GetDoctorAppointmentsLoadingState());
    final result = await homeRepo.getDoctorAppointments(doctorId: doctorId);
    result.fold(
      (failure) =>
          emit(GetDoctorAppointmentsFailureState(errorMessage: failure.message)),
      (appointments) {
        emit(GetDoctorAppointmentsSuccessState(appointments: appointments));
      },
    );
  }
  Future<void>getDoctorReviews({required String doctorId}) async {
    emit(GetDoctorReviewsLoadingState());
    final result = await homeRepo.getDoctorReviews(doctorId: doctorId);
    result.fold(
      (failure) =>
          emit(GetDoctorReviewsFailureState(errorMessage: failure.message)),
      (reviews) {
        emit(GetDoctorReviewsSuccessState(reviews: reviews));
      },
    );
  }

  Future<void> bookPrivateSessionAppointment(
      {required String callID,
      required int startAtIndex,
      required String appointmentId}) async {
    emit(BookPrivateSessionAppointmentLoadingState());
    final result = await homeRepo.bookPrivateSessionAppointment(
        callID: callID, startAtIndex: startAtIndex, appointmentId: appointmentId);
    result.fold(
      (failure) =>
          emit(BookPrivateSessionAppointmentFailureState(errorMessage: failure.message)),
      (_) {
        emit(BookPrivateSessionAppointmentSuccessState());
      },
    );
  }
  Future<void> getBookedPrivateSessions() async {
    emit(GetBookedPrivateSessionsLoadingState());
    final result = await homeRepo.getBookedPrivateSessions();
    result.fold(
      (failure) =>
          emit(GetBookedPrivateSessionsFailureState(errorMessage: failure.message)),
      (appointments) {
        emit(GetBookedPrivateSessionsSuccessState(appointments: appointments));
      },
    );
  }
 }
