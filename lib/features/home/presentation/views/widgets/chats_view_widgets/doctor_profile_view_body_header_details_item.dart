import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';

class DoctorProfileViewBodyHeaderDetailsItem extends StatelessWidget {
  final String title;
  final String value;
  const DoctorProfileViewBodyHeaderDetailsItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyles.bold16,
        ),
        Text(
          value,
          style: TextStyles.semiBold16,
        ),
      ],
    );
  }
}
