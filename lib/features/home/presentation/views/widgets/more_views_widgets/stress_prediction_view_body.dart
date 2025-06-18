import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/helper_functions/custom_quick_alret_view.dart';
import 'package:nafsia/core/helper_functions/extentions.dart';
import 'package:nafsia/core/helper_functions/rouutes.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/constants.dart';
import 'package:nafsia/core/utils/custom_box_decoration.dart';
import 'package:nafsia/core/utils/custom_snak_bar.dart';
import 'package:nafsia/core/widgets/custom_animated_loading_widget.dart';
import 'package:nafsia/core/widgets/custom_button.dart';
import 'package:nafsia/core/widgets/custom_drop_down_form_field.dart';
import 'package:nafsia/core/widgets/custom_text_field.dart';
import 'package:nafsia/features/home/manager/home_cubit/home_cubit.dart';
import 'package:quickalert/models/quickalert_type.dart';

import '../../../../../../core/utils/spacing.dart';

class StressPredictionViewBody extends StatelessWidget {
  const StressPredictionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kHorizontalPadding, vertical: kVerticalPadding),
        child: Form(
          key: cubit.formKey,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: 'الوظيفة',
                
                controller: cubit.jobController,
                onChanged: (value) {
                  cubit.jobController.text = value;
                },
              ),
              verticalSpace(16),
              CustomTextFormField(
                labelText: 'معدل ساعات النوم',
                textInputType: TextInputType.number,
                controller: cubit.sleepDurationController,
                onChanged: (value) {
                  cubit.sleepDurationController.text = value;
                },
              ),
              verticalSpace(16),
              CustomDropdownFormField(
                hintText: 'تقييم حالة النوم',
                items: const [
                  'ضعيفة جدًا',
                  'ضعيفة',
                  'متوسطة',
                  'جيدة',
                  'ممتازة',
                ],
                onChanged: (value) {
                  if (value == 'ضعيفة جدًا') {
                    cubit.sleepQualityController.text = '1';
                  } else if (value == 'ضعيفة') {
                    cubit.sleepQualityController.text = '3';
                  } else if (value == 'متوسطة') {
                    cubit.sleepQualityController.text = '5';
                  } else if (value == 'جيدة') {
                    cubit.sleepQualityController.text = '7';
                  } else if (value == 'ممتازة') {
                    cubit.sleepQualityController.text = '10';
                  }
                },
              ),
              verticalSpace(32),
              BlocConsumer<HomeCubit, HomeState>(
                buildWhen: (previous, current) =>
                    current is GetStressPredictionSuccessState ||
                    current is GetStressPredictionFailureState ||
                    current is GetStressPredictionLoadingState ,
                listener: (context, state) {
                  if (state is GetStressPredictionSuccessState) {
                    customQuickAlertView(
                      context,
                      text: 'نسبة التوتر هي ${state.prediction}',
                      title: 'نسبة التوتر',
                      confirmBtnText:
                          state.prediction > 7 ? 'استعانة بطبيب' : 'حسنًا',
                      type: state.prediction > 7
                          ? QuickAlertType.warning
                          : QuickAlertType.success,
                      onConfirmBtnTap: () {
                        state.prediction > 7
                            ? context.pushNamed(Routes.doctorsView)
                            : context.pop();
                      },
                      showCancelBtn: true,
                    );
                  }
                  if (state is GetStressPredictionFailureState) {
                    showSnackBar(context,
                        text: 'error with sensor : ${state.errorMessage}');
                    print('error with sensor : ${state.errorMessage}');
                  }
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      state is GetStressPredictionSuccessState
                          ? Row(
                              children: [
                                CustomContainer(
                                  color: Colors.red,
                                  icon: Icons.favorite,
                                  text: 'Heart Rate',
                                  value: '${state.heartRate}  bpm',
                                ),
                                CustomContainer(
                                  color: Colors.blueAccent,
                                  icon: Icons.water_drop_rounded,
                                  text: 'SpO2',
                                  value: '${state.spo2} %',
                                )
                              ],
                            )
                          : const SizedBox.shrink(),
                      verticalSpace(32),
                      state is GetStressPredictionLoadingState
                          ? const CustomAnimatedLoadingWidget()
                          : CustomButton(
                              text: 'تنبؤ بنسبة الضغط النفسي',
                              onPressed: () async {
                                if (cubit.formKey.currentState!.validate()) {
                                  cubit.getStressPrediction(
                                    job: cubit.jobController.text,
                                    sleepDuration: int.parse(
                                        cubit.sleepDurationController.text),
                                    sleepQuality: int.parse(
                                        cubit.sleepQualityController.text),
                                  );
                                  
                                }
                              })
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String text;
  final String value;
  final IconData icon;
  final Color color;
  const CustomContainer({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: customBoxDecoration(),
        child: Column(
          children: [
            ListTile(
              leading: Icon(icon, color: color),
              title: Text(
                text,
                style: TextStyles.bold16.copyWith(color: color),
              ),
              subtitle: Text(
                value,
                style: TextStyles.bold16.copyWith(color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
