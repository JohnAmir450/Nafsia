import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/services/get_it_service.dart';
import 'package:nafsia/core/utils/custom_box_decoration.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/core/widgets/my_divider.dart';
import 'package:nafsia/features/home/domain/models/sessions_model.dart';
import 'package:nafsia/features/home/domain/repos/home_repo.dart';
import 'package:nafsia/features/home/manager/home_cubit/home_cubit.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/chats_view_body.dart';
import 'package:nafsia/features/home/presentation/views/widgets/group_chats_widgets/group_chat_card_details_section_list.dart';
import 'package:nafsia/features/home/presentation/views/widgets/group_chats_widgets/group_chat_title_and_price_section.dart';
import 'package:nafsia/features/home/presentation/views/widgets/more_views_widgets/doctor_rating_modal.dart';

class PrivateSessionItem extends StatelessWidget {
  final SessionsModel session;
  final List<SessionsModel> allSessions;

  const PrivateSessionItem({
    super.key,
    required this.session,
    required this.allSessions,
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
          GroupChatTitleSection(communitySessionsModel: session),
          verticalSpace(16),
          const MyDivider(),
          verticalSpace(8),
          Column(
            children: List.generate(allSessions.length, (index) {
              final sessionItem = allSessions[index];
              final isLast = index == allSessions.length - 1;

              return Column(
                children: [
                  GroupChatCardDetailsSectionList(
                    showSeats: false,
                    communitySessionsModel: sessionItem,
                  ),
                  if (!isLast) ...[
                    verticalSpace(8),
                    const MyDivider(),
                    verticalSpace(8),
                  ],
                ],
              );
            }),
          ),
          verticalSpace(16),
          Visibility(
            visible: session.status != 'completed',
            child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.message),
                label: const Text("مراسلة الطبيب"),
                onPressed: () {
                  final doctorId = session.doctorId;
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(chatID: doctorId),
                    ),
                  );
                },
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) => BlocProvider(
                  create: (context) => HomeCubit(getIt<HomeRepo>()),
                  child:  DoctorRatingModal(doctorId:   session.doctorId,),
                ),
              );
            },
            child: const Text('تقييم الطبيب'),
          )
        ],
      ),
    );
  }
}
