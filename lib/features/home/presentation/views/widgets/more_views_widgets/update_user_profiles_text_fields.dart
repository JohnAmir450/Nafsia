import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafsia/core/helper_functions/get_user_data.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/core/widgets/custom_text_field.dart';
import 'package:nafsia/features/home/manager/more_cubit/more_cubit.dart';

class UpdateUserProfileTextFields extends StatelessWidget {
  const UpdateUserProfileTextFields({
    super.key,
    required this.cubit,
  });

  final MoreCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'تعديل البيانات الشخصية',
          style: TextStyles.bold23.copyWith(color: AppColors.primaryColor),
        ),
        verticalSpace(16.h),
        CustomTextFormField(
          textInputType: TextInputType.name,
          hintText: getUserData().user.name,
          controller: cubit.updatedNameController,
          onChanged: (value) {
            cubit.userMakeChanges();

            cubit.updatedNameController.text = value;
          },
        ),
        verticalSpace(16.h),
        CustomTextFormField(
            textInputType: TextInputType.number,
            controller: cubit.updatedAgeController,
            onChanged: (value) {
              cubit.userMakeChanges();
              cubit.updatedAgeController.text = value;
            },
            hintText: getUserData().user.age.toString()),
        verticalSpace(16.h),
        CustomTextFormField(
          textInputType: TextInputType.phone,
          hintText: getUserData().user.phone,
          controller: cubit.updatedPhoneController,
          onChanged: (value) {
            cubit.userMakeChanges();
            cubit.updatedPhoneController.text = value;
          },
        ),
      ],
    );
  }
}
