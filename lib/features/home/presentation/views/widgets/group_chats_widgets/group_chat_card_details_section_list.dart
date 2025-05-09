import 'package:flutter/material.dart';
import 'package:nafsia/core/helper_functions/foramted_date.dart';
import 'package:nafsia/features/home/domain/models/sessions_model.dart';
import 'package:nafsia/features/home/presentation/views/widgets/group_chats_widgets/custom_group_chat_details.dart';

class GroupChatCardDetailsSectionList extends StatelessWidget {
  final SessionsModel communitySessionsModel;
  final bool showSeats ;
  const GroupChatCardDetailsSectionList({
    super.key,
    this.showSeats = true,
    required this.communitySessionsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GroupChatCardDetailsSection(
          title: 'الموعد',
          trailing: formatDateFromDateTime(communitySessionsModel.startAt),
          icon: Icons.calendar_today,
        ),
        
        Visibility(
          visible: showSeats,
          child: GroupChatCardDetailsSection(
            title: 'المقاعد المتبقية',
            trailing: (communitySessionsModel.seats -
                    communitySessionsModel.participations.length)
                .toString(),
            icon: Icons.person,
          ),
        ),
        GroupChatCardDetailsSection(
          title: 'المدة',
          trailing: '${communitySessionsModel.duration} دقيقة',
          icon: Icons.access_time_filled_outlined,
        ),
      ],
    );
  }
}
