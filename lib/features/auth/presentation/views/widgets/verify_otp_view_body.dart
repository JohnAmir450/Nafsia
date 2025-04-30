import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafsia/core/helper_functions/extentions.dart';
import 'package:nafsia/core/helper_functions/rouutes.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/constants.dart';
import 'package:nafsia/core/utils/custom_snak_bar.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/core/widgets/custom_animated_loading_widget.dart';
import 'package:nafsia/core/widgets/custom_button.dart';
import 'package:nafsia/core/widgets/custom_text_field.dart';
import 'package:nafsia/features/auth/presentation/views/widgets/resend_otp_or_enter_email_again.dart';

import '../../../data/forget_password_cubit/forget_password_cubit.dart';

class VerifyOtpViewBody extends StatelessWidget {
  const VerifyOtpViewBody({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 50, horizontal: kHorizontalPadding),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is OtpVerificationSuccessState) {
            showSnackBar(context, text: 'تم التحقق من الرمز بنجاح');
    
            context.pushNamed(Routes.resetPasswordView,
                arguments:
                    context.read<ForgetPasswordCubit>().otpController.text);
          } else if (state is OtpVerificationFailureState) {
            showSnackBar(context, text: state.errorMessage);
          }
        },
        builder: (context, state) {
          return Form(
            key: context.read<ForgetPasswordCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ادخل الرمز الذي تم إرساله إلى : $email  ',
                  style: TextStyles.semiBold16,
                ),
                verticalSpace(8),
                SizedBox(
                  width: 100.w,
                  child: CustomTextFormField(
                    controller:
                        context.read<ForgetPasswordCubit>().otpController,
                    hintText: 'رمز التحقق',
                    needsValidation: true,
                    textAlign: TextAlign.center,
                    textInputType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'من فضلك ادخل الرمز';
                      }
                      return null;
                    },
                  ),
                ),
                verticalSpace(24),
                state is OtpVerificationLoadingState
                    ? const Center(child: CustomAnimatedLoadingWidget())
                    : CustomButton(
                        text: 'تحقق',
                        onPressed: () {
                          if (context
                              .read<ForgetPasswordCubit>()
                              .formKey
                              .currentState!
                              .validate()) {
                            context
                                .read<ForgetPasswordCubit>()
                                .verifyOtp(email: email);
                          }
                        },
                      ),
                verticalSpace(4),
                ResendOtpOrEnterEmailAgain(email: email),
                TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      'إعادة ادخال البريد الالكتروني؟',
                      style: TextStyles.bold16
                          .copyWith(color: AppColors.primaryColor),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}