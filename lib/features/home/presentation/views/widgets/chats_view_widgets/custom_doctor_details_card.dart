import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/custom_box_decoration.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/core/widgets/my_divider.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/doctor_description_card.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/doctor_main_detais_card.dart';

class CustomDoctorDetailsCard extends StatelessWidget {
  const CustomDoctorDetailsCard({
    super.key,
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
          const DoctorMainDetailsCard(),
          verticalSpace(16),
          const DoctorDescriptionCard(),
          verticalSpace(16),
          const MyDivider(),
          verticalSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'عرض التفاصيل',
                        style:
                            TextStyles.semiBold13.copyWith(color: Colors.white),
                      ),
                      horizontalSpace(6),
                      const Icon(Icons.arrow_forward_ios,
                          color: Colors.white, size: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
