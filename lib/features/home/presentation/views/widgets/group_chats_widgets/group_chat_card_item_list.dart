import 'package:flutter/material.dart';
import 'package:nafsia/features/home/domain/models/sessions_model.dart';
import 'package:nafsia/features/home/presentation/views/widgets/group_chats_widgets/group_chat_card_item.dart';

class GroupList extends StatelessWidget {
  final List<SessionsModel> groups;

  const GroupList({super.key, required this.groups});

  @override
  Widget build(BuildContext context) {
   

    return ListView.builder(
      itemCount: groups.length,
      itemBuilder: (context, index) {
        return GroupChatCardItem(communitySessionsModel: groups[index]);
      },
    );
  }
}
