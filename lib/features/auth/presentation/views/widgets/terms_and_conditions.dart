import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafsia/core/helper_functions/terms_and_conditions_widget_view.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/spacing.dart';


class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       // const CustomCheckBox(),
        horizontalSpace(16.w),
        Expanded(
          child: GestureDetector(
            onTap: () {
              showTermsAndConditionsDialog(context);
            },
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'من خلال إنشاء حساب فأنت توافق على ',
                  style: TextStyles.semiBold13
                      .copyWith(color: const Color(0xff949D9E))),
              TextSpan(
                  text: 'الشروط والاحكام الخاصة بنا',
                  style: TextStyles.semiBold13
                      .copyWith(color:  AppColors.lightPrimaryColor)),
            ])),
          ),
        )
      ],
    );
  }
}