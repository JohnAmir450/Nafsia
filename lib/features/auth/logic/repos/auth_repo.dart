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
}
