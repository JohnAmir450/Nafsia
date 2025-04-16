import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';

class GroupChatTitleAndPriceSection extends StatelessWidget {
  const GroupChatTitleAndPriceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('متى تختار الانفصال ؟ ',
            style: TextStyles.bold19
                .copyWith(color: AppColors.primaryColor)),
        Spacer(),
        Text(
          '100 جنيه',
          style:
              TextStyles.bold19.copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
