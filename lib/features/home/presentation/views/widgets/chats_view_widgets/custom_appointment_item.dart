import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/features/home/domain/models/doctor_appointment_model.dart';

class CustomAppointmentItem extends StatelessWidget {
  final AppointmentModel appointment;
  final bool isSelected;
  const CustomAppointmentItem(
      {super.key, this.isSelected = false, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
            color: isSelected ? AppColors.primaryColor : Colors.grey),
        color: isSelected ? AppColors.primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            appointment.day,
            style: TextStyles.semiBold16.copyWith(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          verticalSpace(4),
          Text(
            appointment.startAtHour,
            style: TextStyles.semiBold16.copyWith(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
