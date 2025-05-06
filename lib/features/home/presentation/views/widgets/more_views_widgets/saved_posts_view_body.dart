import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/helper_functions/custom_quick_alret_view.dart';
import 'package:nafsia/core/helper_functions/extentions.dart';
import 'package:nafsia/core/helper_functions/get_dummy_post.dart';
import 'package:nafsia/core/utils/custom_snak_bar.dart';
import 'package:nafsia/core/widgets/custom_post_item.dart';
import 'package:nafsia/features/home/manager/home_cubit/home_cubit.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SavedPostsViewBody extends StatelessWidget {
  const SavedPostsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is RemovePostFromSavedPostsFailureState) {
          showSnackBar(context, text: state.errorMessage);
        } else if (state is RemovePostFromSavedPostsSuccessState) {
          showSnackBar(context, text: 'تم حذف المنشور بنجاح');
        }
      },
      buildWhen: (previous, current) =>
          current is GetSavedPostsSuccessState ||
          current is GetSavedPostsFailureState ||
          current is GetSavedPostsLoadingState,
      builder: (context, state) {
        if (state is GetSavedPostsSuccessState) {
          var cubit = context.read<HomeCubit>();
          return ListView.builder(
            itemBuilder: (context, index) => Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                CustomPostItem(
                  postModel: state.posts[index],
                ),
                IconButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  onPressed: () {
                    customQuickAlertView(
                      context,
                      text: 'هل تريد حذف المنشور من المحفوظات؟',
                      title: 'حذف من المحفوظات',
                      confirmBtnText: 'نعم',
                      showCancelBtn: true,
                      type: QuickAlertType.warning,
                      onConfirmBtnTap: () async {
                        await cubit.removePostFromSavedPosts(
                            postId: state.posts[index].id);
                        context.pop();
                        cubit.getSavedPosts();
                      },
                    );
                  },
                  icon: const Icon(Icons.delete_outline),
                ),
              ],
            ),
            itemCount: state.posts.length,
          );
        } else if (state is GetSavedPostsFailureState) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return  Skeletonizer(
            child: Center(
              child: ListView.builder(
                itemBuilder: (context, index) =>  CustomPostItem(postModel: getDummyPost(),),
                itemCount: 10,
              ),
            ),
          );
        }
      },
    );
  }
}
