import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/core/widgets/custom_cached_network_image.dart';
import 'package:nafsia/features/home/domain/models/doctor_model.dart';

class DoctorProfileViewSliverAppBar extends StatelessWidget {
  const DoctorProfileViewSliverAppBar({
    super.key,
    required this.doctor,
  });

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: 70,
      expandedHeight: 300,
      surfaceTintColor: Colors.white,
      pinned: true,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Center(
          child: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      foregroundColor: Colors.black,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding:
            const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
        title: LayoutBuilder(
          builder: (context, constraints) {
            final isCollapsed = constraints.maxHeight < 70;
            return Row(
              mainAxisAlignment: isCollapsed
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (isCollapsed)
                  CustomCachedNetworkImageWidget(
                      imageUrl: doctor.avatarUrl!, borderRadius: 8,fit: BoxFit.fill,),
                const SizedBox(width: 8),
                Text(
                  doctor.name,
                  style: TextStyles.bold16
                      .copyWith(fontSize: isCollapsed ? 16 : 20),
                ),
              ],
            );
          },
        ),
        background: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: kToolbarHeight), // padding from top
            CircleAvatar(
              radius: 68.r,
              backgroundColor: AppColors.primaryColor,
              child: CustomCachedNetworkImageWidget(
                  height: 170,
                  width: 170,
                  fit: BoxFit.fill,
                  imageUrl: doctor.avatarUrl,
                  borderRadius: 80),
            ),
            verticalSpace(24),
            
          ],
        ),
      ),
    );
  }
}

