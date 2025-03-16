import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_images.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/spacing.dart';

class LoginViewBodyLogoAndTitle extends StatelessWidget {
  const LoginViewBodyLogoAndTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Assets.assetsImagesNafsiaLogo,
        ),
        verticalSpace(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'مرحبًا بكم في نفسية',
              style:
                  TextStyles.bold28.copyWith(color: AppColors.primaryColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
