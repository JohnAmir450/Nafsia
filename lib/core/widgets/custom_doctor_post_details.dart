import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/core/widgets/custom_cached_network_image.dart';
import 'package:nafsia/features/home/domain/models/doctor_data_model.dart';
import 'package:timeago/timeago.dart' as timeago;
class CustomDoctorPostDetails extends StatelessWidget {
  final DoctorDataModel doctorData;
  final DateTime createdAt;
  const CustomDoctorPostDetails({
    super.key,
    required this.doctorData, required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('ar', timeago.ArMessages());
    return Row(
      children: [
        CustomCachedNetworkImageWidget(
          
          imageUrl: doctorData.avatarUrl,
          borderRadius: 8,
          height: 40.h,
          fit: BoxFit.cover,
        ),
        horizontalSpace(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctorData.name,
              style: TextStyles.semiBold16,
            ),
            Text(
                timeago.format(createdAt,locale: 'ar'),
                style: TextStyles.semiBold16.copyWith(color: Colors.grey),
              ),
          ],
        ),
      ],
    );
  }
}
