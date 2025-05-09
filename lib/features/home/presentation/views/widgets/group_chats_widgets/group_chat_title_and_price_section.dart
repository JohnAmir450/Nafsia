import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/core/widgets/custom_cached_network_image.dart';
import 'package:nafsia/features/home/domain/models/sessions_model.dart';

class GroupChatTitleSection extends StatelessWidget {
  final SessionsModel? communitySessionsModel;
  const GroupChatTitleSection({
    super.key,
    required this.communitySessionsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: communitySessionsModel?.title !='Private Session',
          child: Text(communitySessionsModel?.title ?? '',
              style: TextStyles.bold19.copyWith(color: AppColors.primaryColor)),
        ),
        Row(
          children: [
            CustomCachedNetworkImageWidget(
              borderRadius: 16,
              imageUrl: communitySessionsModel?.doctorData.avatarUrl,
              height: 40,
              width: 40,
            ),
            horizontalSpace(8),
            Text(communitySessionsModel?.doctorData.name ?? '',
                style: TextStyles.bold13),
            horizontalSpace(8),
            Text(
                communitySessionsModel?.doctorData.doctorData?.specialization ??
                    '',
                style: TextStyles.semiBold13.copyWith(color: Colors.grey)),
          ],
        )
      ],
    );
  }
}
