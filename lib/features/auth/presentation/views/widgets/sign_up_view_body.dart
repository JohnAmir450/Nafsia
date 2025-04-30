import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nafsia/core/helper_functions/app_regex.dart';
import 'package:nafsia/core/helper_functions/extentions.dart';
import 'package:nafsia/core/helper_functions/rouutes.dart';
import 'package:nafsia/core/utils/custom_snak_bar.dart';
import 'package:nafsia/core/widgets/custom_animated_loading_widget.dart';
import 'package:nafsia/core/widgets/custom_button.dart';
import 'package:nafsia/core/widgets/custom_drop_down_form_field.dart';
import 'package:nafsia/core/widgets/custom_text_field.dart';
import 'package:nafsia/features/auth/data/sign_up_cubit/sign_up_cubit.dart';
import 'package:nafsia/features/auth/presentation/views/widgets/already_have_account.dart';
import '../../../../../core/utils/spacing.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  // Holds the selected value

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SignUpCubit>();
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailureState) {
          showSnackBar(context, text: state.errorMessage);
        }else if(state is SignUpSuccessState){
          showSnackBar(context, text: 'تم التسجيل بنجاح');
          context.pushNamed(Routes.mainView);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoadingState,
          progressIndicator: const CustomAnimatedLoadingWidget(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 24.h),
            child: SingleChildScrollView(
              child: Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      textInputType: TextInputType.name,
                      hintText: 'الاسم',
                      controller: cubit.nameController,
                      onChanged: (value) {
                        cubit.nameController.text = value;
                      },
                    ),
                    
                    verticalSpace(16),
                    CustomTextFormField(
                      textInputType: TextInputType.number,
                      hintText: 'العمر',
                      controller: cubit.ageController,
                      onChanged: (value) {
                        cubit.ageController.text = value;
                      },
                    ),
                    verticalSpace(16),
                    CustomDropdownFormField(
                      hintText: 'الجنس',
                      needsValidation: true,
                      items: ['ذكر', 'أنثى'],
                      value: cubit.selectedGender, // Pass the selected value
                      onChanged: (newValue) {
                        setState(() {
                          cubit.selectedGender = newValue;
                        });
                      },
                    ),
                    verticalSpace(16),
                    CustomTextFormField(
                      hintText: 'البريد الالكتروني',
                      controller: cubit.emailController,
                      onChanged: (value) {
                        cubit.emailController.text = value;
                      },
                    ),
                    verticalSpace(16),
                    CustomTextFormField(
                      textInputType: TextInputType.phone,
                      hintText: 'رقم الهاتف',
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !AppRegex.isPhoneNumberValid(value)) {
                          return 'برجاء ادخال رقم هاتف صالح';
                        }
                        return null;
                      },
                      controller: cubit.phoneNumberController,
                      onChanged: (value) {
                        cubit.phoneNumberController.text = value;
                      },
                    ),
                    verticalSpace(16.h),
                    CustomTextFormField(
                      textInputType: TextInputType.visiblePassword,
                      isObscured: cubit.isObscured,
                      hintText: 'كلمة المرور',
                      suffixIcon: GestureDetector(
                          onTap: () {
                            cubit.changePasswordVisibility();
                          },
                          child: cubit.suffixIcon),
                      controller: cubit.passwordController,
                      onChanged: (value) {
                        cubit.passwordController.text = value;
                      },
                    ),
                    verticalSpace(16.h),
                    //const TermsAndConditionsWidget(),
                    verticalSpace(30.h),
                    CustomButton(
                      text: 'إنشاء حساب',
                      onPressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.signUp();
                        }
                      },
                    ),
                    verticalSpace(25),
                    const AlreadyHaveAnAccount(),
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
