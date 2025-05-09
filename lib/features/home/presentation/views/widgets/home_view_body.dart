import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/helper_functions/get_dummy_post.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/constants.dart';
import 'package:nafsia/core/utils/custom_snak_bar.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/core/widgets/custom_post_item.dart';
import 'package:nafsia/features/home/manager/home_cubit/home_cubit.dart';
import 'package:nafsia/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<HomeCubit>().getAllPosts(),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: kHorizontalPadding, vertical: kVerticalPadding),
            child: CustomHomeAppBar(),
          )),
          SliverToBoxAdapter(
            child: verticalSpace(16),
          ),
          BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state is SavePostSuccessState) {
                  showSnackBar(context,
                      text: 'تم حفظ المنشور بنجاح',
                      color: AppColors.primaryColor);
                } else if (state is SavePostFailureState) {
                  showSnackBar(context, text: state.errorMessage);
                }
              },
              buildWhen: (previous, current) =>
                  current is GetAllPostsLoadingState ||
                  current is GetAllPostsSuccessState ||
                  current is GetAllPostsFailureState,
              builder: (context, state) {
                if (state is GetAllPostsLoadingState) {
                  return SliverToBoxAdapter(
                    child: Skeletonizer(
                        child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) => CustomPostItem(
                        postModel: getDummyPost(),
                      ),
                    )),
                  );
                }

                if (state is GetAllPostsSuccessState) {
                  return SliverList.builder(
                    itemBuilder: (context, index) => CustomPostItem(
                      postModel: state.posts[index],
                    ),
                    itemCount: state.posts.length,
                  );
                } else if (state is GetAllPostsFailureState) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(state.errorMessage),
                    ),
                  );
                } else {
                  // Don't show any loader here; RefreshIndicator will handle it
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                }
              })
        ],
      ),
    );
  }
}
