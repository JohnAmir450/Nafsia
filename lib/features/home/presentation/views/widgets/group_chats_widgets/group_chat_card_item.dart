import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/custom_box_decoration.dart';
import 'package:nafsia/core/widgets/my_divider.dart';
import 'package:nafsia/features/home/domain/models/sessions_model.dart';
import 'package:nafsia/features/home/presentation/views/widgets/group_chats_widgets/group_chat_card_details_section_list.dart';
import 'package:nafsia/features/home/presentation/views/widgets/group_chats_widgets/group_chat_register_button.dart';
import 'package:nafsia/features/home/presentation/views/widgets/group_chats_widgets/group_chat_title_and_price_section.dart';
import '../../../../../../core/utils/spacing.dart';

class GroupChatCardItem extends StatelessWidget {
  final SessionsModel communitySessionsModel;
  const GroupChatCardItem({
    super.key,
    required this.communitySessionsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: customBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GroupChatTitleSection(
            communitySessionsModel: communitySessionsModel,
          ),
          verticalSpace(16),
          const MyDivider(),
          verticalSpace(8),
          GroupChatCardDetailsSectionList(
            communitySessionsModel: communitySessionsModel,
          ),
          GroupChatRegisterButton(
            communitySessionsModel: communitySessionsModel,
          ),
        ],
      ),
    );
  }
}
