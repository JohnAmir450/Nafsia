import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:nafsia/core/errors/custom_exceptions.dart';
import 'package:nafsia/core/errors/failures.dart';
import 'package:nafsia/core/helper_functions/get_user_data.dart';
import 'package:nafsia/core/services/api_consumer.dart';
import 'package:nafsia/core/services/api_endpoints.dart';
import 'package:nafsia/features/home/domain/models/posts_model.dart';
import 'package:nafsia/features/home/domain/repos/home_repo.dart';

class HomeRepoImplementation extends HomeRepo {
  final ApiConsumer apiConsumer;

  HomeRepoImplementation(this.apiConsumer);
  @override
  Future<Either<Failure, List<PostModel>>> getPosts() async {
    try {
      final response = await apiConsumer.get(ApiEndpoints.getAllPosts);
      final List<dynamic> data = response['data'];
      return right(data.map((e) => PostModel.fromJson(e)).toList());
    } on ServerException catch (e) {
      return left(CustomFailure(message: e.errorModel.errorMessage));
    } catch (e) {
      log(e.toString());
      return left(CustomFailure(message: 'حدث خطاء ما، حاول مرة اخرى'));
    }
  }

  @override
  Future<Either<Failure, void>> reactPost(
      {required String postId, required String reaction}) async {
    try {
      final token = getUserData().token;
      await apiConsumer.post(ApiEndpoints.reactPost, data: {
        'postId': postId,
        'reactType': reaction,
      }, headers: {
        'Authorization': 'Bearer $token'
      });
      print(token);
      return right(null);
    } on ServerException catch (e) {
      return left(CustomFailure(message: e.errorModel.errorMessage));
    } catch (e) {
      print(e.toString());
      return left(CustomFailure(message: 'حدث خطاء ما، حاول مرة اخرى'));
    }
  }

  @override
  Future<Either<Failure, int>> getPostReactions(
      {required String postId}) async {
    try {
      final response = await apiConsumer.get(
        ApiEndpoints.getPostReactions,
        data: {
          'postId': postId,
        },
      );

      final data = response['data'];

      if (data is List) {
        // Count only 'like' reactions if needed
        final likeCount =
            data.where((item) => item['reactType'] == 'like').length;
        return right(likeCount);
      } else {
        return right(0); // default if response isn't a list
      }
    } on ServerException catch (e) {
      return left(CustomFailure(message: e.errorModel.errorMessage));
    } catch (e) {
      print(e.toString());
      return left(CustomFailure(message: 'حدث خطأ ما، حاول مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, void>> removeReaction({required String postId}) async {
    try {
      final token = getUserData().token;
      await apiConsumer.delete(
        ApiEndpoints.reactPost,
        data: {'postId': postId},
        headers: {'Authorization': 'Bearer $token'},
      );
      return right(null);
    } on ServerException catch (e) {
      return left(CustomFailure(message: e.errorModel.errorMessage));
    } catch (e) {
      print(e.toString());
      return left(CustomFailure(message: 'حدث خطأ ما، حاول مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, void>> savePost({required String postId}) async {
    try {
      final token = getUserData().token;
      await apiConsumer.post(
        ApiEndpoints.savePost,
        data: {
          'postId': postId,
        },
        headers: {'Authorization': 'Bearer $token'},
      );
      return right(null);
    } on ServerException catch (e) {
      return left(CustomFailure(message: e.errorModel.errorMessage));
    } catch (e) {
      print(e.toString());
      return left(CustomFailure(message: 'حدث خطاء ما، حاول مرة اخرى'));
    }
  }
}
