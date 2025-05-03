import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafsia/core/helper_functions/get_user_data.dart';
import 'package:nafsia/core/utils/constants.dart';
import 'package:nafsia/core/utils/custom_snak_bar.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/core/widgets/custom_animated_loading_widget.dart';
import 'package:nafsia/features/home/manager/more_cubit/more_cubit.dart';
import 'package:nafsia/features/home/presentation/views/widgets/more_views_widgets/update_user_profile_button.dart';
import 'package:nafsia/features/home/presentation/views/widgets/more_views_widgets/update_user_profiles_text_fields.dart';

class UserProfileViewBody extends StatefulWidget {
  const UserProfileViewBody({super.key});

  @override
  State<UserProfileViewBody> createState() => _UserProfileViewBodyState();
}

class _UserProfileViewBodyState extends State<UserProfileViewBody> {
  @override
  void initState() {
    var cubit = context.read<MoreCubit>();
    cubit.updatedNameController.text = getUserData().user.name;
    cubit.updatedPhoneController.text = getUserData().user.phone;
    cubit.updatedAgeController.text = getUserData().user.age.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MoreCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding, vertical: kVerticalPadding),
      child: BlocConsumer<MoreCubit, MoreState>(
        listener: (context, state) {
          if (state is UpdateUserProfileSuccessState) {
            showSnackBar(context, text: 'تم التعديل بنجاح');
          } else if (state is UpdateUserProfileFailureState) {
            showSnackBar(context, text: state.errorMessage);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              verticalSpace(24.h),
              UpdateUserProfileTextFields(cubit: cubit),
              verticalSpace(48.h),
              state is UpdateUserProfileLoadingState
                  ? const Center(child: CustomAnimatedLoadingWidget())
                  : UpdateUserProfileButton(cubit: cubit),
            ],
          );
        },
      ),
    );
  }
}

