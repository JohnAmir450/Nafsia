import 'package:flutter/material.dart';
import 'package:nafsia/features/home/presentation/views/widgets/group_chats_widgets/custom_group_chat_details.dart';

class GroupChatCardDetailsSectionList extends StatelessWidget {
  const GroupChatCardDetailsSectionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
         GroupChatCardDetailsSection(
          title: 'الموعد',
          trailing:  'لخميس, 28 | نوفمبر  3:00 مساءا',
          icon: Icons.calendar_today,
        ),
         GroupChatCardDetailsSection(
          title: 'المقاعد المتبقية',
          trailing:  '3 مقاعد',
          icon: Icons.person,
        ),
         GroupChatCardDetailsSection(
          title: 'المدة',
          trailing:  '2 ساعات',
          icon: Icons.access_time_filled_outlined,
        ),
      ],
    );
  }
}

