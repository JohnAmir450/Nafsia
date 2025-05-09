import 'package:flutter/material.dart';
import 'package:nafsia/core/helper_functions/extentions.dart';
import 'package:nafsia/core/helper_functions/get_user_data.dart';
import 'package:nafsia/core/helper_functions/rouutes.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/features/home/domain/models/sessions_model.dart';
import 'package:nafsia/features/home/manager/communiity_sessions_cubit/community_sessions_cubit.dart';
import 'package:provider/provider.dart';

class GroupChatRegisterButton extends StatelessWidget {
  final SessionsModel communitySessionsModel;
  const GroupChatRegisterButton({
    super.key,
    required this.communitySessionsModel,
  });

  @override
  Widget build(BuildContext context) {
    final bool isParticipating =
        communitySessionsModel.participations.contains(getUserData().user.id);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            if (isParticipating) {
              context.pushNamed(Routes.communitySessionChatView,
                  arguments: communitySessionsModel);
            } else {
              context
                  .read<CommunitySessionsCubit>()
                  .participateInCommunitySession(
                      sessionId: communitySessionsModel.id);
              context.pushNamed(Routes.communitySessionChatView,
                  arguments: communitySessionsModel);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isParticipating
                  ? AppColors.primaryColor
                  : AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Text(
                  isParticipating ? 'دخول' : 'تسجيل',
                  style: TextStyles.semiBold13.copyWith(color: Colors.white),
                ),
                horizontalSpace(6),
                const Icon(Icons.arrow_forward_ios,
                    color: Colors.white, size: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
