import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/custom_box_decoration.dart';
import 'package:nafsia/core/utils/custom_snak_bar.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/core/widgets/my_divider.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/appointment_details_section.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/custom_appointment_item.dart';
import '../../../../manager/doctors_cubit/doctors_cubit.dart';

class DoctorProfileViewBodyDetailsAndAppointmentsSection
    extends StatefulWidget {
  const DoctorProfileViewBodyDetailsAndAppointmentsSection({super.key});

  @override
  State<DoctorProfileViewBodyDetailsAndAppointmentsSection> createState() =>
      _DoctorProfileViewBodyDetailsAndAppointmentsSectionState();
}

class _DoctorProfileViewBodyDetailsAndAppointmentsSectionState
    extends State<DoctorProfileViewBodyDetailsAndAppointmentsSection> {
  int? selectedAppointmentIndex;
  int? selectedScheduleIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: customBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'نبذة عن الدكتور',
            style: TextStyles.bold16,
          ),
          verticalSpace(8),
          const Text(
            'د. أحمد خالد هو استشاري في الطب النفسي بخبرة تتجاوز 15 عامًا في تشخيص وعلاج اضطرابات القلق، الاكتئاب، والاضطرابات النفسية المرتبطة بالضغوط الحياتية. حاصل على درجة الدكتوراه في الطب النفسي من جامعة القاهرة، وشارك في العديد من المؤتمرات المحلية والدولية. يؤمن د. أحمد بأهمية العلاج النفسي الحديث القائم على الأدلة، ويحرص على دمج الجلسات العلاجية المعرفية السلوكية مع أحدث التوجهات العلمية لضمان نتائج فعالة ومستدامة لمرضاه.',
            style: TextStyles.regular16,
          ),
          const MyDivider(),
          verticalSpace(8),
          Text('المواعيد المتاحة', style: TextStyles.bold16),
          verticalSpace(12),
          BlocConsumer<DoctorsCubit, DoctorsState>(
            listener: (context, state) {
              if (state is BookPrivateSessionAppointmentSuccessState) {
                showSnackBar(context,
                    text: 'تم حجز الموعد بنجاح', color: AppColors.primaryColor);
              }
              if (state is BookPrivateSessionAppointmentFailureState) {
                showSnackBar(context, text: state.errorMessage);
              }
            },
            buildWhen: (previous, current) =>
                current is GetDoctorAppointmentsSuccessState ||
                current is GetDoctorAppointmentsFailureState ||
                current is GetDoctorAppointmentsLoadingState,
            builder: (context, state) {
              if (state is GetDoctorAppointmentsSuccessState) {
                if (state.appointments.isEmpty) {
                  return const Text('لا يوجد مواعيد متاحة في الوقت الحالي');
                }
                return Column(
                  children: [
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selectedAppointmentIndex == index) {
                                  selectedAppointmentIndex = null;
                                } else {
                                  selectedAppointmentIndex = index;
                                }
                              });
                            },
                            child: CustomAppointmentItem(
                              appointment: state.appointments[index],
                              isSelected: selectedAppointmentIndex == index,
                            )),
                        itemCount: state.appointments.length,
                      ),
                    ),
                    verticalSpace(16),
                    AppointmentDetailsSection(
                      state: state,
                      selectedAppointmentIndex: selectedAppointmentIndex,
                      selectedScheduleIndex: selectedScheduleIndex,
                      onScheduleTap: (index) {
                        setState(() {
                          if (selectedScheduleIndex == index) {
                            selectedScheduleIndex = null;
                          } else {
                            selectedScheduleIndex = index;
                          }
                        });
                      },
                    )
                  ],
                );
              } else if (state is GetDoctorAppointmentsFailureState) {
                return Center(child: Text(state.errorMessage));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
