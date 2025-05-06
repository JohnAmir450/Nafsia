import 'package:flutter/material.dart';
import 'package:nafsia/core/helper_functions/extentions.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/custom_box_decoration.dart';

import '../../../../../../core/helper_functions/rouutes.dart';

class CustomShowMoreDoctorsWidgetCard extends StatelessWidget {
  const CustomShowMoreDoctorsWidgetCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.doctorsView);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.12,
          maxWidth: MediaQuery.of(context).size.width * 0.6,
          minWidth:  MediaQuery.of(context).size.width *
          0.5 ,
        ),
        padding: EdgeInsets.all(
            MediaQuery.of(context).size.width * 0.03), // Adaptive padding
        decoration: customBoxDecoration(
            opacity: 0.08, mainColor: AppColors.primaryColor),
        child: Row(
          children: [
            Text('اظهار المزيد',
                style: TextStyles.bold16.copyWith(color: Colors.white)),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
