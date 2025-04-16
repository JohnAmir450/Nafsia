import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/custom_box_decoration.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/features/home/domain/entities/more_views_entity.dart';

class MoreViewsCardItem extends StatelessWidget {
  final MoreViewsEntity moreViewsEntity;
  const MoreViewsCardItem({
    super.key,
    required this.moreViewsEntity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => moreViewsEntity.onTap?.call(context),
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: customBoxDecoration(mainColor: moreViewsEntity.cardColor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(moreViewsEntity.icon,
                size: 20.sp, color: AppColors.primaryColor),
            verticalSpace(8),
            Text(moreViewsEntity.text, style: TextStyles.bold13),
          ],
        ),
      ),
    );
  }
}
