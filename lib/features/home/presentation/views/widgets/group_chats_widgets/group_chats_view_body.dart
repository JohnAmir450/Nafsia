import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/constants.dart';
import 'package:nafsia/features/home/presentation/views/widgets/custom_main_view_app_bar.dart';
import 'package:nafsia/features/home/presentation/views/widgets/group_chats_widgets/group_chat_card_item.dart';

class GroupChatsViewBody extends StatelessWidget {
  const GroupChatsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
        vertical: kVerticalPadding,
      ),
      child:  Column(
        children: [
          const CustomMainViewsAppBar(title: 'مجموعات الدعم'),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => const GroupChatCardItem(),
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}



