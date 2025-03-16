import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafsia/core/helper_functions/app_regex.dart';
import 'package:nafsia/core/widgets/custom_button.dart';
import 'package:nafsia/core/widgets/custom_drop_down_form_field.dart';
import 'package:nafsia/core/widgets/custom_text_field.dart';
import 'package:nafsia/features/auth/presentation/views/widgets/already_have_account.dart';
import '../../../../../core/utils/spacing.dart';
class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  String? selectedGender; // Holds the selected value

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 24.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomTextFormField(
              textInputType: TextInputType.name,
              hintText: 'الاسم الاول',
            ),
            verticalSpace(16),
            const CustomTextFormField(
              textInputType: TextInputType.name,
              hintText: 'الاسم الثاني',
            ),
            verticalSpace(16),
            const CustomTextFormField(
              textInputType: TextInputType.number,
              hintText: 'العمر',
            ),
            verticalSpace(16),
            CustomDropdownFormField(
              hintText: 'الجنس',
              needsValidation: true,
              items: ['ذكر', 'أنثى'],
              value: selectedGender, // Pass the selected value
              onChanged: (newValue) {
                setState(() {
                  selectedGender = newValue; // Update the value
                });
              },
            ),
            verticalSpace(16),
            const CustomTextFormField(
              hintText: 'البريد الالكتروني',
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
            ),
            verticalSpace(16.h),
            CustomTextFormField(
              textInputType: TextInputType.visiblePassword,
              onChanged: (value) {},
              hintText: 'كلمة المرور',
              suffixIcon: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.visibility,
                    color: Color(0xff949D9E),
                  )),
            ),
            verticalSpace(16.h),
            //const TermsAndConditionsWidget(),
            verticalSpace(30.h),
            const CustomButton(
              text: 'إنشاء حساب',
            ),
            verticalSpace(25),
            const AlreadyHaveAnAccount(),
          ],
        ),
      ),
    );
  }
}
