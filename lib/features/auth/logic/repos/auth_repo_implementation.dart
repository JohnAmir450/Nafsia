import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:nafsia/core/errors/custom_exceptions.dart';
import 'package:nafsia/core/errors/failures.dart';
import 'package:nafsia/core/helper_functions/cache_helper.dart';
import 'package:nafsia/core/services/api_consumer.dart';
import 'package:nafsia/core/services/api_endpoints.dart';
import 'package:nafsia/core/utils/chache_helper_keys.dart';
import 'package:nafsia/features/auth/logic/repos/auth_repo.dart';
import 'package:nafsia/features/auth/logic/repos/models/user_model.dart';

class AuthRepoImplementation implements AuthRepo {
  final ApiConsumer apiConsumer;
  AuthRepoImplementation(this.apiConsumer);
  @override
  Future<Either<Failure, void>> signUp({
    required String email,
    required String password,
    required String name,
    required String gender,
    required int age,
    required String role,
    required String phoneNumber,
  }) async {
    try {
      final Map<String, dynamic> response = await apiConsumer.post(
        ApiEndpoints.signUp,
        data: {
          'email': email,
          'password': password,
          'name': name,
          'phone': phoneNumber,
          'age': age,
          'gender': gender,
          'role': 'user',
        },
        isFromData: true,
      );
      final userModelData = UserModel.fromJson(response['data']);

      await saveUserData(userModelData);

      return right(null);
    } on ServerException catch (e) {
      return left(CustomFailure(message: e.errorModel.errorMessage));
    } catch (e) {
      log(e.toString());
      return left(CustomFailure(message: 'حدث خطاء ما، حاول مرة اخرى'));
    }
  }

  @override
  Future<Either<Failure, void>> logIn(
      {required String email, required String password}) async {
    try {
      final Map<String, dynamic> response = await apiConsumer.post(
        ApiEndpoints.logIn,
        data: {
          'email': email,
          'password': password,
        },
      );
      final userModelData = UserModel.fromJson(response['data']);
      await saveUserData(userModelData);
      return right(null);
    } on ServerException catch (e) {
      return left(CustomFailure(message: e.errorModel.errorMessage));
    } catch (e) {
      log(e.toString());
      return left(CustomFailure(message: 'حدث خطاء ما، حاول مرة اخرى'));
    }
  }

   Future<void> saveUserData(UserModel userModelData) async {
    var userData = jsonEncode(userModelData.toJson());

    await CacheHelper.saveData(key: kSaveUserDataKey, value: userData);
  }
}
