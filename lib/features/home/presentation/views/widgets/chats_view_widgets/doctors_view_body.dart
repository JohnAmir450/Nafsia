import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/helper_functions/get_dummy_doctor.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/core/widgets/search_text_field.dart';
import 'package:nafsia/features/home/manager/doctors_cubit/doctors_cubit.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/custom_doctor_details_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DoctorsViewBody extends StatelessWidget {
  const DoctorsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<DoctorsCubit>().getAllDoctors(),
      child: SingleChildScrollView(
        child: BlocConsumer<DoctorsCubit, DoctorsState>(
          buildWhen: (previous, current) =>
              current is GetAllDoctorsSuccessState ||
              current is GetAllDoctorsFailureState ||
              current is GetAllDoctorsLoadingState ||
              current is SearchDoctorsLoadingState,
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is GetAllDoctorsSuccessState) {
              return Column(
                children: [
                  SearchTextField(
                    onChanged: (value) {
                      if (value.isEmpty) {
                        context.read<DoctorsCubit>().getAllDoctors();
                      } else {
                        context
                            .read<DoctorsCubit>()
                            .searchDoctors(doctorName: value);
                      }
                    },
                  ),
                  verticalSpace(24),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => CustomDoctorDetailsCard(
                            doctor: state.doctors[index],
                          ),
                      itemCount: state.doctors.length),
                ],
              );
            } else if (state is GetAllDoctorsFailureState) {
              return Center(child: Text(state.errorMessage));
            } else {
              return Column(
                children: [
                  SearchTextField(
                    onChanged: (value) {
                      context
                          .read<DoctorsCubit>()
                          .searchDoctors(doctorName: value);
                    },
                  ),
                  verticalSpace(24),
                  Skeletonizer(
                    enabled: state is SearchDoctorsLoadingState ||
                        state is GetAllDoctorsLoadingState,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            CustomDoctorDetailsCard(
                              doctor: getDummyDoctor(),
                            ),
                        itemCount: 5),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
