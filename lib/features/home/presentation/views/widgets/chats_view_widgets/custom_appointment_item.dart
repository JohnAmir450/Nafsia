import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/features/home/domain/models/doctor_appointment_model.dart';

class CustomAppointmentItem extends StatefulWidget {
  final AppointmentModel appointment;
  final bool isSelected;
    
  const CustomAppointmentItem(
      {super.key, this.isSelected = false, required this.appointment});

  @override
  State<CustomAppointmentItem> createState() => _CustomAppointmentItemState();
}

class _CustomAppointmentItemState extends State<CustomAppointmentItem> {
  late String formattedDate;
  late String dayName;
  @override
  void initState() {
    // TODO: implement initState

    final dateTime = DateTime.parse(widget.appointment.day);

// Adjust timezone if needed (optional depending on UTC/local)
    final localDate = dateTime.toLocal();

     formattedDate = DateFormat('d/M').format(localDate);
    // 19/4
     dayName = DateFormat('EEEE').format(localDate);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
            color: widget.isSelected ? AppColors.primaryColor : Colors.grey),
        color: widget.isSelected ? AppColors.primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            formattedDate,
            style: TextStyles.semiBold16.copyWith(
              color: widget.isSelected ? Colors.white : Colors.black,
            ),
          ),
          verticalSpace(4),
          Text(
            dayName,
            style: TextStyles.semiBold16.copyWith(
              color: widget.isSelected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
