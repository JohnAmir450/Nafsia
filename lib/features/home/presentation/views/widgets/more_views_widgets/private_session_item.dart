import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/custom_box_decoration.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/core/widgets/my_divider.dart';
import 'package:nafsia/features/home/domain/models/sessions_model.dart';
import 'package:nafsia/features/home/presentation/views/widgets/group_chats_widgets/group_chat_card_details_section_list.dart';
import 'package:nafsia/features/home/presentation/views/widgets/group_chats_widgets/group_chat_title_and_price_section.dart';

class PrivateSessionItem extends StatelessWidget {
  final SessionsModel session;

  const PrivateSessionItem({super.key, required this.session});

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
            communitySessionsModel: session, // Replace with actual model
          ),
          verticalSpace(16),
          const MyDivider(),
          verticalSpace(8),
          GroupChatCardDetailsSectionList(
            showSeats: false,
            communitySessionsModel: session, // Replace with actual model
          ),
        ],
      ),
    );
  }
}