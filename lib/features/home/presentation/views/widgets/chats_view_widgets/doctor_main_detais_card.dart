import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/core/widgets/custom_cached_network_image.dart';
import 'package:nafsia/features/home/domain/models/doctor_model.dart';

class DoctorMainDetailsCard extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorMainDetailsCard({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCachedNetworkImageWidget(
          imageUrl: doctor.avatarUrl,
          borderRadius: 8,
          height: 50,
          width: 50,
          fit: BoxFit.fill,
        ),
        horizontalSpace(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  doctor.name,
                  style: TextStyles.bold19,
                ),
              ),
              Visibility(
                visible: doctor.doctorData?.specialization != null,
                child: Text(
                  doctor.doctorData?.specialization ?? '',
                  style:
                      TextStyles.semiBold13.copyWith(color: Colors.grey[700]),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
