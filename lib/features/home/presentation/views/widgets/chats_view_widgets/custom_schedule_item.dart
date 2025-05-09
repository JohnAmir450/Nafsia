import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/features/home/domain/models/doctor_appointment_model.dart';

class CustomScheduleItem extends StatelessWidget {
  final ScheduleItem scheduleItem;
  final bool isSelected;
  const CustomScheduleItem(
      {super.key, required this.scheduleItem, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final bool isBooked = scheduleItem.isBooked;

    final Color backgroundColor = isBooked
        ? Colors.grey.shade300
        : isSelected
            ? AppColors.primaryColor
            : Colors.white;

    final Color borderColor = isBooked
        ? Colors.grey
        : isSelected
            ? AppColors.primaryColor
            : AppColors.primaryColor;

    final Color textColor = isBooked
        ? Colors.black45
        : isSelected
            ? Colors.white
            : Colors.black;

    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        scheduleItem.startAt,
        style: TextStyles.semiBold16.copyWith(color: textColor),
      ),
    );
  }
}
