import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/helper_functions/get_dummy_community_chat_item.dart';
import 'package:nafsia/core/utils/custom_snak_bar.dart';
import 'package:nafsia/features/home/manager/communiity_sessions_cubit/community_sessions_cubit.dart';
import 'package:nafsia/features/home/presentation/views/widgets/group_chats_widgets/group_chat_card_item.dart';
import 'package:nafsia/features/home/presentation/views/widgets/group_chats_widgets/group_chat_card_item_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GroupPagesView extends StatelessWidget {
  const GroupPagesView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CommunitySessionsCubit>();
    final pageController = PageController(initialPage: cubit.currentPage);

    return BlocConsumer<CommunitySessionsCubit, CommunitySessionsState>(
      buildWhen: (prev, curr) =>
          curr is CommunitySessionsSuccessState ||
          curr is CommunitySessionsFailureState ||
          curr is CommunitySessionsLoadingState,
      listener: (context, state) {
        if (state is ParticipateInCommunitySessionsSuccessState) {
          showSnackBar(context, text: 'تم الانضمام بنجاح');
        } else if (state is CommunitySessionsFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        if (state is CommunitySessionsSuccessState) {
          final allGroups = cubit.allGroups ?? [];
          final myGroups = cubit.myGroups ?? [];

          return PageView(
            controller: pageController,
            onPageChanged: cubit.togglePage,
            children: [
              GroupList(groups: allGroups),
              GroupList(groups: myGroups),
            ],
          );
        } else if (state is CommunitySessionsFailureState) {
          return const Center(child: Text('فشل تحميل المجموعات'));
        } else {
          return Skeletonizer(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (_, __) => GroupChatCardItem(
                communitySessionsModel: getDummyCommunitySessions(),
              ),
            ),
          );
        }
      },
    );
  }
}