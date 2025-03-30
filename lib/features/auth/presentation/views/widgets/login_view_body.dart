import 'package:flutter/material.dart';
import 'package:nafsia/core/helper_functions/extentions.dart';
import 'package:nafsia/core/helper_functions/rouutes.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_images.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/core/widgets/custom_button.dart';
import 'package:nafsia/core/widgets/custom_text_field.dart';
import 'package:nafsia/features/auth/presentation/views/widgets/dont_have_account.dart';
import 'package:nafsia/features/auth/presentation/views/widgets/login_method_item.dart';
import 'package:nafsia/features/auth/presentation/views/widgets/login_view_body_logo_and_title.dart';
import 'package:nafsia/features/auth/presentation/views/widgets/or_divider.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const LoginViewBodyLogoAndTitle(),
            verticalSpace(64),
            const CustomTextFormField(
                borderRadius: 16,
                hintText: 'البريد الإلكتروني',
                needsValidation: true),
            verticalSpace(16),
            const CustomTextFormField(
                borderRadius: 16,
                hintText: ' الرقم السري',
                needsValidation: true),
            verticalSpace(16),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'نسيت كلمة المرور ؟ ',
                style:
                    TextStyles.bold16.copyWith(color: AppColors.secondaryColor),
              ),
            ),
            verticalSpace(16),
             CustomButton(
              text: 'تسجيل الدخول',
              onPressed: (){
                context.pushNamed(Routes.mainView);
              },
            ),
            verticalSpace(16),
            const DontHaveAnAccount(),
            verticalSpace(30),
            const OrDivider(),
            verticalSpace(60),
            const LoginMethodItem(
              image: Assets.assetsImagesGoogleIcon,
              text: 'تسجيل الدخول بواسطة جوجل',
            ),
          ],
        ),
      ),
    );
  }
}

