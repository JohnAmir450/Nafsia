import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:nafsia/core/errors/custom_exceptions.dart';
import 'package:nafsia/core/errors/failures.dart';
import 'package:nafsia/core/helper_functions/cache_helper.dart';
import 'package:nafsia/core/helper_functions/get_user_data.dart';
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

  @override
  Future<Either<Failure, void>> forgetPassword({required String email}) async {
    try {
      await apiConsumer
          .post(ApiEndpoints.forgetPassword, data: {'email': email});
      return right(null);
    } on ServerException catch (e) {
      return left(CustomFailure(message: e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      await apiConsumer.post(ApiEndpoints.verifyOtp, data: {
        'email': email,
        'otp': otp,
      });
      return right(null);
    } on ServerException catch (e) {
      return left(CustomFailure(message: e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({
    required String otp,
    required String newPassword,
  }) async {
    try {
      await apiConsumer.post(ApiEndpoints.resetPassword, data: {
        'otp': otp,
        'password': newPassword,
      });
      return right(null);
    } on ServerException catch (e) {
      return left(CustomFailure(message: e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> updateUserProfile({
    String? name,
    String? phone,
    int? age,
  }) async {
    try {
      var token = getUserData().token;
      final response = await apiConsumer.patch(
        ApiEndpoints.updateUserProfile,
        data: {
          'name': name,
          'phone': phone,
          'age': age,
        },
        isFromData: true,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      // 1. Get the existing user data from cache
      final oldUserData = await CacheHelper.getData(key: kSaveUserDataKey);
      if (oldUserData == null) {
        return left(
            CustomFailure(message: 'لم يتم العثور على بيانات المستخدم'));
      }

      final oldUser = UserModel.fromJson(jsonDecode(oldUserData));

      // 2. Merge the new data into the existing user
      final updatedJson = response['data'];
      final newUser = oldUser.user.copyWith(
        name: updatedJson['name'],
        phone: updatedJson['phone'],
        age: updatedJson['age'],
      );

      // 3. Save the updated user
      await saveUserData(UserModel(user: newUser, token: getUserData().token));

      return right(null);
    } on ServerException catch (e) {
      return left(CustomFailure(message: e.errorModel.errorMessage));
    } catch (e) {
      log(e.toString());
      return left(CustomFailure(message: 'حدث خطأ أثناء تحديث البيانات'));
    }
  }

  @override
  Future<Either<Failure, void>> changeUserPassword(
      {required String oldPassword, required String newPassword})async {
    try {
      var token = getUserData().token;
      await apiConsumer.put(
        ApiEndpoints.changeUserPassword,
        data: {
          'oldPassword': oldPassword,
          'newPassword': newPassword,
        },
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      return right(null);
    } on ServerException catch (e) {
      return left(CustomFailure(message: e.errorModel.errorMessage));
    } catch (e) {
      log(e.toString());
      return left(CustomFailure(message: 'حدث خطاء ما، حاول مرة اخرى'));
    }
  }
  
  @override
  Future<Either<Failure, void>> logout()async {
    try {
  var token = getUserData().token;
    await apiConsumer.post(ApiEndpoints.logout, headers: {
      'Authorization': 'Bearer $token',
    });
    await CacheHelper.removeData(key: kSaveUserDataKey);
      
    return right(null);
} on ServerException catch (e) {
  return left(CustomFailure(message: e.errorModel.errorMessage));
} catch (e) {
  log(e.toString());
  return left(CustomFailure(message: 'حدث خطاء ما، حاول مرة اخرى'));
}
  }
}
 
// @override
// Future<Either<Failure, void>> updateUserProfile({ String? name, String? phone, String? age }) async {
//   try {
//     final token = getUserData().token;
    
//     final response = await apiConsumer.post(
//       ApiEndpoints.updateUserProfile,
//       data: {
//         'name': name,
//         'phone': phone,
//         'age': age,
//       },
//       isFromData: true,
//       headers: {
//         'Authorization': 'Bearer $token',
//       },
//     );

//     // Optional: update cached user data
//     final updatedUser = UserModel.fromJson(response['data']);
//     await saveUserData(updatedUser);

//     return right(null);
//   } on ServerException catch (e) {
//     return left(CustomFailure(message: e.errorModel.errorMessage));
//   } catch (e) {
//     return left(CustomFailure(message: 'حدث خطأ ما، حاول مرة أخرى'));
//   }
// }
