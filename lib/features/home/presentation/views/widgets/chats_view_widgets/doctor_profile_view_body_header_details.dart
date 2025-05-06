import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/custom_box_decoration.dart';
import 'package:nafsia/core/widgets/custom_vertical_divider.dart';
import 'package:nafsia/features/home/domain/models/doctor_model.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/doctor_profile_view_body_header_details_item.dart';
import 'package:timeago/timeago.dart' as timeago;

class DoctorProfileViewBodyHeaderDetails extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorProfileViewBodyHeaderDetails({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: customBoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DoctorProfileViewBodyHeaderDetailsItem(
            title: 'التقييم',
            value: doctor.doctorData?.rate.toString() ?? '-',
          ),
          const CustomVerticalDivider(),
          DoctorProfileViewBodyHeaderDetailsItem(
            title: 'تاريخ الانضمام',
            value:
                timeago.format(DateTime.parse(doctor.createdAt), locale: 'ar'),
          ),
          const CustomVerticalDivider(),
          DoctorProfileViewBodyHeaderDetailsItem(
            title: 'التخصص',
            value: doctor.doctorData?.specialization ?? '-',
          ),
        ],
      ),
    );
  }
}