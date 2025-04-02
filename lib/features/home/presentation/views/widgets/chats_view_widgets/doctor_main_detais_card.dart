import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/app_images.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/spacing.dart';

class DoctorMainDetailsCard extends StatelessWidget {
  const DoctorMainDetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage:
              AssetImage(Assets.assetsImagesProfileTestImage),
        ),
       horizontalSpace(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'د. مريم حسن',
                style: TextStyles.bold23,
              ),
              Text(
                'أخصائي نفسي',
                style: TextStyles.semiBold13.copyWith(color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
