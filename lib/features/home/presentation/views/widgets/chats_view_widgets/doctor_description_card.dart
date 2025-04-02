import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';

class DoctorDescriptionCard extends StatelessWidget {
  const DoctorDescriptionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'مستشارة اجتماعية وأسرية مع أكثر من 14 عامًا من الخبرة.',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyles.semiBold16.copyWith(color: Colors.grey[800]),
    );
  }
}