import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nafsia/core/helper_functions/extentions.dart';
import 'package:nafsia/core/utils/app_images.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/core/widgets/custom_button.dart';

import '../../../../../../core/helper_functions/rouutes.dart';

class EmptyChatsList extends StatelessWidget {
  const EmptyChatsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.assetsImagesChatsActive,
            height: 50.h,
          ),
          verticalSpace(16),
          const Text(
            'ليس لديك محادثات مفتوحة',
            style: TextStyles.bold19,
          ),
          verticalSpace(
            16,
          ),
          Text(
            'حجزك للجلسه الاولى تمكنك من التحدث مع الاخصائي مباشرة للحالات الطارئه فقط ولا يغني عن الجلسه ولا تزيد عن 100 كلمه',
            textAlign: TextAlign.center,
            style: TextStyles.semiBold16
                .copyWith(color: const Color(0xff797979)),
          ),
          verticalSpace(32),
          CustomButton(text: 'تصفح الاخصائيين', onPressed: () {
            context.pushNamed(Routes.doctorsView);
          }),
        ],
      ),
    );
  }
}
