import 'package:flutter/material.dart';
import 'package:nafsia/core/helper_functions/get_user_data.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/custom_snak_bar.dart';
import 'package:nafsia/core/widgets/custom_button.dart';
import 'package:nafsia/features/home/manager/more_cubit/more_cubit.dart';

class UpdateUserProfileButton extends StatelessWidget {
  const UpdateUserProfileButton({
    super.key,
    required this.cubit,
  });

  final MoreCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        backgroundColor: cubit.hasChanges
            ? AppColors.primaryColor
            : Colors.grey,
        text: 'حفظ',
        onPressed: () {
          cubit.hasChanges
              ? cubit.updateUserProfile(
                  name: cubit.updatedNameController.text ==
                          getUserData().user.name
                      ? getUserData().user.name
                      : cubit.updatedNameController.text,
                  phone: cubit.updatedPhoneController.text ==
                          getUserData().user.phone
                      ? getUserData().user.phone
                      : cubit.updatedPhoneController.text,
                  age: int.parse(
                      cubit.updatedAgeController.text ==
                              getUserData().user.age.toString()
                          ? getUserData().user.age.toString()
                          : cubit.updatedAgeController.text),
                )
              : showSnackBar(context, text: 'لا يوجد تغييرات');
        });
  }
}
