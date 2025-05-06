import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/helper_functions/get_dummy_doctor.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/features/home/manager/doctors_cubit/doctors_cubit.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/custom_show_more_doctors_widget_card.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/featured_doctor_chats_view_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BookYourAppointmentNowSection extends StatelessWidget {
  const BookYourAppointmentNowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsCubit, DoctorsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'احجز جلستك الآن',
                style:
                    TextStyles.bold23.copyWith(color: AppColors.primaryColor),
              ),
              verticalSpace(16),
              BlocBuilder<DoctorsCubit, DoctorsState>(
                builder: (context, state) {
                  if (state is GetAllDoctorsSuccessState) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            state.doctors.length > 5 ? 6 : state.doctors.length,
                        itemBuilder: (context, index) {
                          if (index == 5) {
                            return const CustomShowMoreDoctorsWidgetCard();
                          }
                          return FeaturedDoctorChatsViewItem(
                            doctor: state.doctors[index],
                          );
                        },
                      ),
                    );
                  } else if (state is GetAllDoctorsFailureState) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  } else {
                    return Skeletonizer(
                        child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: ListView.builder(
                        
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return FeaturedDoctorChatsViewItem(
                            doctor: getDummyDoctor(),
                          );
                        },
                      ),
                    ));
                  }
                },
              ),
              verticalSpace(16),
            ],
          ),
        );
      },
    );
  }
}
