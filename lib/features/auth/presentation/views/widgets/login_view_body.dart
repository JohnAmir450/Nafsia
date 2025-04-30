import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nafsia/core/helper_functions/extentions.dart';
import 'package:nafsia/core/helper_functions/rouutes.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_images.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/custom_snak_bar.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/core/widgets/custom_animated_loading_widget.dart';
import 'package:nafsia/core/widgets/custom_button.dart';
import 'package:nafsia/core/widgets/custom_text_field.dart';
import 'package:nafsia/features/auth/data/login_cubit/login_cubit.dart';
import 'package:nafsia/features/auth/presentation/views/widgets/dont_have_account.dart';
import 'package:nafsia/features/auth/presentation/views/widgets/login_method_item.dart';
import 'package:nafsia/features/auth/presentation/views/widgets/login_view_body_logo_and_title.dart';
import 'package:nafsia/features/auth/presentation/views/widgets/or_divider.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailureState) {
          showSnackBar(context, text: state.errorMessage);
        } else if (state is LoginSuccessState) {
          context.pushNamed(Routes.mainView);
        }
      },
      builder: (context, state) {
        var cubit = context.read<LoginCubit>();
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoadingState,
          progressIndicator: const CustomAnimatedLoadingWidget(),
          child: Form(
            key: cubit.formKey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const LoginViewBodyLogoAndTitle(),
                    verticalSpace(64),
                    CustomTextFormField(
                      borderRadius: 16,
                      hintText: 'البريد الإلكتروني',
                      needsValidation: true,
                      controller: cubit.emailController,
                      textInputType: TextInputType.emailAddress,
                      onChanged: (value) {
                        cubit.emailController.text = value;
                      },
                    ),
                    verticalSpace(16),
                    CustomTextFormField(
                      borderRadius: 16,
                      hintText: ' الرقم السري',
                      isObscured: cubit.isObscured,
                      needsValidation: true,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          cubit.changePasswordVisibility();
                        },
                        child: cubit.suffixIcon,
                      ),
                      controller: cubit.passwordController,
                      textInputType: TextInputType.visiblePassword,
                      onChanged: (value) {
                        cubit.passwordController.text = value;
                      },
                    ),
                    verticalSpace(16),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        'نسيت كلمة المرور ؟ ',
                        style: TextStyles.bold16
                            .copyWith(color: AppColors.secondaryColor),
                      ),
                    ),
                    verticalSpace(16),
                    CustomButton(
                      text: 'تسجيل الدخول',
                      onPressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.login();
                        }
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
            ),
          ),
        );
      },
    );
  }
}
