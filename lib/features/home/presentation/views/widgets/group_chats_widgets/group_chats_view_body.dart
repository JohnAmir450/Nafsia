import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/helper_functions/get_user_data.dart';
import 'package:nafsia/core/services/get_it_service.dart';
import 'package:nafsia/core/utils/constants.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/features/home/domain/repos/home_repo.dart';
import 'package:nafsia/features/home/manager/communiity_sessions_cubit/community_sessions_cubit.dart';
import 'package:nafsia/features/home/presentation/views/widgets/custom_main_view_app_bar.dart';
import 'package:nafsia/features/home/presentation/views/widgets/group_chats_widgets/group_chat_toggle_buttons_view_body.dart';
import 'package:nafsia/features/home/presentation/views/widgets/group_chats_widgets/group_chats_pages.dart';

class GroupChatsViewBody extends StatefulWidget {
  const GroupChatsViewBody({super.key});

  @override
  State<GroupChatsViewBody> createState() => _GroupChatsViewBodyState();
}

class _GroupChatsViewBodyState extends State<GroupChatsViewBody> {
  late final CommunitySessionsCubit _cubit;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _cubit = CommunitySessionsCubit(getIt<HomeRepo>());
    _cubit.getCommunitySessions(); 
    _cubit.getCommunitySessions(userId: getUserData().user.id); 
  }

  @override
  void dispose() {
    _pageController.dispose();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child:  Padding(
        padding:  const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
          vertical: kVerticalPadding,
        ),
        child: Column(
          children: [
             const CustomMainViewsAppBar(title: 'مجموعات الدعم'),
             verticalSpace(16),
             const GroupChatsToggleButtonsViewBody(),
             verticalSpace(16),
             const Expanded(child: GroupPagesView()),
          ],
        ),
      ),
    );
  }
}




