import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/features/home/domain/models/doctor_model.dart';
import 'package:nafsia/features/home/presentation/views/widgets/more_views_widgets/custom_user_information_item.dart';

class DoctorDescriptionCard extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorDescriptionCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'مستشارة اجتماعية وأسرية مع أكثر من 14 عامًا من الخبرة.',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.semiBold16.copyWith(color: Colors.grey[800]),
        ),
        verticalSpace(8.h),
        Text(
          'معلومات عن الدكتور',
          style: TextStyles.bold16,
        ),
        verticalSpace(4),
        CustomUserInformationItem(
          withDecoration: false,
          title: 'التخصص: ',
          value: doctor.doctorData?.specialization ?? '-',
        ),
        CustomUserInformationItem(
          withDecoration: false,
          title: 'العمر: ',
          value: '${doctor.age} سنة',
        ),
        CustomUserInformationItem(
          withDecoration: false,
          title: 'البريد الالكتروني: ',
          value: doctor.email,
        ),
        CustomUserInformationItem(
          withDecoration: false,
          title: 'التقييم: ',
          value: '${doctor.doctorData?.rate} /5⭐',
        ),
      ],
    );
  }
}
