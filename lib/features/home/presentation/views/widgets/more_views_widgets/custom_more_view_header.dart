import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafsia/core/helper_functions/get_user_data.dart';
import 'package:nafsia/core/services/get_it_service.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_images.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/features/auth/logic/repos/auth_repo.dart';
import 'package:nafsia/features/auth/logic/repos/models/user_model.dart';
import 'package:nafsia/features/home/manager/more_cubit/more_cubit.dart';
import 'package:nafsia/features/home/presentation/views/widgets/more_views_widgets/measurments_modal_sheet.dart';

class CustomMoreViewHeader extends StatelessWidget {
  const CustomMoreViewHeader({
    super.key,
    required this.user,
  });

  final UserDataModel user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200.h,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryColor, AppColors.primaryColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
        ),
        Positioned(
          top: 40.h,
          left: 0,
          right: 0,
          child: Column(
            children: [
              getUserData().user.gender == 'male'
                  ? CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50.r,
                      child: CircleAvatar(
                        radius: 48.r,
                        backgroundImage: const AssetImage(
                          Assets.assetsImagesProfileTestImage,
                        ),
                      ),
                    )
                  : CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50.r,
                      child: CircleAvatar(
                        radius: 48.r,
                        backgroundImage: const AssetImage(
                          Assets.assetsImagesFemaleProfileImage,
                        ),
                      ),
                    ),
              verticalSpace(12),
              Text(
                user.name,
                style: TextStyles.bold19.copyWith(color: Colors.white),
              ),
              Text(
                user.email,
                style: TextStyles.regular14.copyWith(color: Colors.white70),
              ),
            ],
          ),
        ),
       Align(
  alignment: Alignment.topLeft,
  child: IconButton(
    onPressed: () {
      // Call the Cubit method to load data before opening modal
      context.read<MoreCubit>().getUserMeasurements();

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (_) => BlocProvider(
          create: (context) => MoreCubit( getIt<AuthRepo>(),)..getUserMeasurements(),
          child: const UserMeasurementsModalSheet(),
        ),
      );
    },
    icon: CircleAvatar(
      backgroundColor: Colors.white,
      child: const Icon(Icons.edit_calendar, color: AppColors.primaryColor)),
  ),
),

      ],
    );
  }
}
