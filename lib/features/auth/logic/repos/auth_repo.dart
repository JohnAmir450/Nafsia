import 'package:nafsia/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> signUp(
      {required String email,
      required String password,
      required String name,
      required String gender,
      required int age,
      required String phoneNumber,
      required String role});

  Future<Either<Failure, void>> logIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> forgetPassword({
    required String email,
  });

  Future<Either<Failure, void>> verifyOtp({
    required String email,
    required String otp,
  });

  Future<Either<Failure, void>> resetPassword({
    required String otp,
    required String newPassword,
  });

  Future<Either<Failure, void>> updateUserProfile({
    String? name,
    String? phone,
    int? age,
  });
  Future<Either<Failure, void>> changeUserPassword({
    required String oldPassword,
    required String newPassword,
  });
  Future<Either<Failure, void>> logout();
}
