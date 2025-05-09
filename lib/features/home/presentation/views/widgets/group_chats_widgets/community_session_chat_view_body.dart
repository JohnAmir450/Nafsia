import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/helper_functions/get_dummy_community_session_message.dart';
import 'package:nafsia/core/helper_functions/get_dummy_doctor.dart';
import 'package:nafsia/core/widgets/custom_message_bubble.dart';
import 'package:nafsia/features/home/domain/models/sessions_model.dart';
import 'package:nafsia/features/home/manager/communiity_sessions_cubit/community_sessions_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CommunitySessionChatViewBody extends StatelessWidget {
  final SessionsModel communitySessionsModel;
  const CommunitySessionChatViewBody({
    super.key,
    required this.communitySessionsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<CommunitySessionsCubit, CommunitySessionsState>(
            builder: (context, state) {
              if (state is GetCommunitySessionMessagesSuccessState) {
                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.messages.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final message = state.messages[index];
                    return DoctorMessageBubble(
                      communityMessageModel: message,
                      doctorDataModel: communitySessionsModel.doctorData,
                    );
                  },
                );
              } else if (state is GetCommunitySessionMessagesFailureState) {
                return Center(child: Text(state.errorMessage));
              } else {
                return Skeletonizer(
                  child: Expanded(
                      child: ListView.builder(
                          itemCount: 20,
                          itemBuilder: (_, index) => DoctorMessageBubble(
                                communityMessageModel:
                                    getDummyCommunitySessionMessage(),
                                doctorDataModel: getDummyDoctor(),
                              ))),
                );
              }
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.info_outline, size: 20, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                'الاخصائيين فقط هم من يستطيعون ارسال رسائل',
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
