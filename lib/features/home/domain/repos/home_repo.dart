import 'package:dartz/dartz.dart';
import 'package:nafsia/core/errors/failures.dart';
import 'package:nafsia/core/models/reveiew_model.dart';
import 'package:nafsia/features/home/domain/models/community_messages_model.dart';
import 'package:nafsia/features/home/domain/models/doctor_appointment_model.dart';
import 'package:nafsia/features/home/domain/models/doctor_model.dart';
import 'package:nafsia/features/home/domain/models/sessions_model.dart';
import 'package:nafsia/features/home/domain/models/posts_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<PostModel>>> getPosts();
  Future<Either<Failure, void>> reactPost(
      {required String postId, required String reaction});
  Future<Either<Failure, int>> getPostReactions({required String postId});
  Future<Either<Failure, void>> removeReaction({required String postId});
  Future<Either<Failure, void>> savePost({required String postId});
  Future<Either<Failure, List<PostModel>>> getSavedPosts();
  Future<Either<Failure, void>> removePostFromSavedPosts(
      {required String postId});

  Future<Either<Failure, List<DoctorModel>>> getAllDoctors();
  Future<Either<Failure, List<AppointmentModel>>> getDoctorAppointments(
      {required String doctorId});
  Future<Either<Failure, void>> bookPrivateSessionAppointment(
      {required String callID,
       required int startAtIndex,
      required String appointmentId});

  Future<Either<Failure, List<DoctorModel>>> searchDoctors(
      {required String doctorName});
  Future<Either<Failure, List<ReviewModel>>> getDoctorReviews(
      {required String doctorId});
  Future<Either<Failure, List<SessionsModel>>> getCommunitySessions({String? userId});
  Future<Either<Failure, void>> participateInCommunitySession(
      {required String sessionId});

      Future<Either<Failure, List<CommunityMessageModel>>> getCommunitySessionMessages({required String sessionId});

Future<Either<Failure, List<SessionsModel>>>getBookedPrivateSessions();
}
