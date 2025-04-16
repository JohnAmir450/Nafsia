import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_images.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/features/home/domain/entities/more_views_entity.dart';
import 'package:nafsia/features/home/presentation/views/widgets/custom_main_view_app_bar.dart';
import 'package:nafsia/features/home/presentation/views/widgets/more_views_widgets/more_views_card_item.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MoreViewBody();
  }
}

class MoreViewBody extends StatelessWidget {
  const MoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const PageScrollPhysics(),
      child: Column(
        children: [
          const CustomMainViewsAppBar(title: 'الملف الشخصي'),
          verticalSpace(64),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40.r,
                backgroundImage: const AssetImage(Assets.assetsImagesProfileTestImage),
              ),
            ],
          ),
          Text(
            'مريم حسن',
            style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
          ),
          const Text('21 عام', style: TextStyles.semiBold16),
          verticalSpace(32),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.3,
              child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 2.5),
            itemCount: 4,
            itemBuilder: (context, index) => MoreViewsCardItem(
              moreViewsEntity: moreViewsList[index],
            ),
          )),
          verticalSpace(16),
        ],
      ),
    );
  }
}

