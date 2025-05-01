import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/features/home/domain/models/posts_model.dart';
import 'package:nafsia/features/home/manager/home_cubit/home_cubit.dart';

class CustomPostActions extends StatelessWidget {
  final PostModel postModel;
  const CustomPostActions({
    super.key,
    required this.postModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        final postId = postModel.id;
        final isLiked = cubit.isLiked[postId] == 'like';
        final reactionCount =
            cubit.postReactions[postId] ?? postModel.reactions.length;

        return Row(
          children: [
            IconButton(
                onPressed: () async {
                  await cubit.reactPost(postId: postId, reaction: 'like');
                },
                icon: isLiked
                    ? const Icon(
                        Icons.favorite,
                        color: AppColors.primaryColor,
                      )
                    : const Icon(
                        Icons.favorite_border_outlined,
                        color: AppColors.primaryColor,
                      )),
            Text(reactionCount.toString()),
            const Spacer(),
            IconButton(
              onPressed: () {
                cubit.savePost(postId: postId);
              },
              icon: const Icon(
                Icons.add_circle_outline_outlined,
                color: AppColors.primaryColor,
              ),
            ),
            verticalSpace(12),
          ],
        );
      },
    );
  }
}
