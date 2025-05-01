import 'package:dartz/dartz.dart';
import 'package:nafsia/core/errors/failures.dart';
import 'package:nafsia/features/home/domain/models/posts_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<PostModel>>> getPosts();
  Future<Either<Failure, void>> reactPost(
      {required String postId, required String reaction});
  Future<Either<Failure, int>> getPostReactions({required String postId});
  Future<Either<Failure, void>> removeReaction({required String postId});
  Future<Either<Failure, void>> savePost({required String postId});
}
