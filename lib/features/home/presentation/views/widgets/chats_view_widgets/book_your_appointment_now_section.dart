import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/custom_show_more_doctors_widget_card.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/featured_doctor_chats_view_item.dart';

class BookYourAppointmentNowSection extends StatelessWidget {
  const BookYourAppointmentNowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'احجز جلستك الآن',
            style: TextStyles.bold23.copyWith(color: AppColors.primaryColor),
          ),
          verticalSpace(16),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.12,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount:
                  11, // Increased by 1 to accommodate the "Show More" button
              itemBuilder: (context, index) {
                if (index == 10) {
                  // Last item (Show More button)
                  return const CustomShowMoreDoctorsWidgetCard();
                }
                return const FeaturedDoctorChatsViewItem();
              },
            ),
          ),
          verticalSpace(16),
        ],
      ),
    );
  }
}

