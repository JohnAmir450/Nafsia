import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nafsia/core/helper_functions/get_user_data.dart';
import 'package:nafsia/features/home/domain/models/posts_model.dart';
import 'package:nafsia/features/home/domain/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitialState());
  Map<String, String> isLiked = {};
  //late int postReactions ;
  Map<String, int> postReactions = {}; // key: postId, value: count
 

  Future<void> getAllPosts() async {
    emit(GetAllPostsLoadingState());
    final result = await homeRepo.getPosts();

    result.fold(
      (failure) => emit(GetAllPostsFailureState(errorMessage: failure.message)),
      (posts) {
        checkIPostLiked(posts);

        emit(GetAllPostsSuccessState(posts: posts));
      },
    );
    
  }

  Future<void> reactPost(
      {required String postId, required String reaction}) async {
    final alreadyLiked = isLiked[postId] == reaction;

    final result = alreadyLiked
        ? await homeRepo.removeReaction(postId: postId)
        : await homeRepo.reactPost(postId: postId, reaction: reaction);

    result.fold(
      (failure) => emit(ReactPostFailureState(errorMessage: failure.message)),
      (_) async {
        if (alreadyLiked) {
          isLiked.remove(postId);
        } else {
          isLiked[postId] = reaction;
        }
        await getPostReactions(postId: postId);
        emit(ReactPostSuccessState());
      },
    );
  }

  Future<void> getPostReactions({required String postId}) async {
    final result = await homeRepo.getPostReactions(postId: postId);
    result.fold(
      (failure) => emit(ReactPostFailureState(errorMessage: failure.message)),
      (count) {
        postReactions[postId] = count;
        emit(GetPostReactionsSuccessState());
      },
    );
  }

  Future<void> savePost({required String postId}) async {
    final result = await homeRepo.savePost(postId: postId);
    result.fold(
      (failure) => emit(SavePostFailureState(errorMessage: failure.message)),
      (_) {
        emit(SavePostSuccessState());
      },
    );
  }

  Future<void> getSavedPosts() async {
    emit(GetSavedPostsLoadingState());
    var result = await homeRepo.getSavedPosts();
    result.fold(
        (failure) =>
            emit(GetSavedPostsFailureState(errorMessage: failure.message)),
        (posts) {
      checkIPostLiked(posts);

      emit(GetSavedPostsSuccessState(posts: posts));
    });
  }

    Future<void> removePostFromSavedPosts({required String postId}) async {
      final result = await homeRepo.removePostFromSavedPosts(postId: postId);
      result.fold(
        (failure) => emit(RemovePostFromSavedPostsFailureState(errorMessage: failure.message)),
        (_) {
          emit(RemovePostFromSavedPostsSuccessState());
        },
      );
    }

  void checkIPostLiked(List<PostModel> posts) {
    final String currentUserId = getUserData().user.id;

    for (var post in posts) {
      final postId = post.id;

      // Set total like count
      final likeCount =
          post.reactions.where((reaction) => reaction.type == 'like').length;
      postReactions[postId] = likeCount;

      // Set if the current user has liked this post
      final isLikedByUser =
          post.reactions.any((reaction) => reaction.user.id == currentUserId);
      isLiked[postId] = isLikedByUser ? 'like' : '';
    }
  }
}
