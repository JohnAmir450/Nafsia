import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/services/paymob_manager.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/custom_snak_bar.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/core/widgets/custom_animated_loading_widget.dart';
import 'package:nafsia/core/widgets/custom_button.dart';
import 'package:nafsia/features/home/manager/doctors_cubit/doctors_cubit.dart';
import 'package:nafsia/features/home/presentation/views/payment_web_view.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/custom_schedule_item.dart';

class AppointmentDetailsSection extends StatelessWidget {
  final int? selectedAppointmentIndex;
  final int? selectedScheduleIndex;
  final void Function(int) onScheduleTap;
  final GetDoctorAppointmentsSuccessState state;

  const AppointmentDetailsSection({
    super.key,
    required this.selectedAppointmentIndex,
    required this.selectedScheduleIndex,
    required this.onScheduleTap,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    if (selectedAppointmentIndex == null) return const SizedBox.shrink();

    final appointment = state.appointments[selectedAppointmentIndex!];

    return Column(
      children: [
        Text('تفاصيل الموعد', style: TextStyles.bold16),
        verticalSpace(8),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: appointment.schedule.length,
            itemBuilder: (context, index) {
              final scheduleItem = appointment.schedule[index];
              return GestureDetector(
                onTap:
                    scheduleItem.isBooked ? null : () => onScheduleTap(index),
                child: CustomScheduleItem(
                  isSelected: selectedScheduleIndex == index,
                  scheduleItem: scheduleItem,
                ),
              );
            },
          ),
        ),
        Row(
          children: [
            Text('مدة الجلسة : ', style: TextStyles.bold16),
            Text('${appointment.duration} دقيقة', style: TextStyles.semiBold16),
            const Spacer(),
            Text('سعر الجلسة : ', style: TextStyles.bold16),
            Text('${appointment.price} جنيه', style: TextStyles.semiBold16),
          ],
        ),
        verticalSpace(16),
        if (selectedScheduleIndex != null)
          BlocBuilder<DoctorsCubit, DoctorsState>(
            builder: (context, state) {
              return state is BookPrivateSessionAppointmentLoadingState
                  ? const CustomAnimatedLoadingWidget()
                  : CustomButton(
                      text: 'حجز موعد',
                      onPressed: () async {
                        final token = await PaymobManager()
                            .getPaymentKey(appointment.price, "EGP");
                        var result = await Navigator.push<bool>(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                PaymentWebViewScreen(paymentToken: token),
                          ),
                        );
                        print('result $result');
                        if (result == true) {
                          // Proceed with booking session
                          context
                              .read<DoctorsCubit>()
                              .bookPrivateSessionAppointment(
                                amount: appointment.price,
                                callID: 'https://meet.google.com/mdt-gvvq-amb',
                                startAtIndex: selectedScheduleIndex!,
                                appointmentId: appointment.id,
                              );
                        } else {
                          // Show error message
                          showSnackBar(context, text: "فشل الدفع أو تم إلغاؤه");
                        }
                      },
                    );
            },
          ),
      ],
    );
  }
}
