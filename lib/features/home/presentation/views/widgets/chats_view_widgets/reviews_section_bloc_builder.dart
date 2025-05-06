import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/custom_box_decoration.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/features/home/manager/doctors_cubit/doctors_cubit.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/custom_doctor_review_item.dart';

class ReviewsSectionBlocBuilder extends StatelessWidget {
  const ReviewsSectionBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: customBoxDecoration(),
      child: BlocBuilder<DoctorsCubit, DoctorsState>(
        buildWhen: (previous, current) =>
            current is GetDoctorReviewsSuccessState ||
            current is GetDoctorReviewsFailureState ||
            current is GetDoctorReviewsLoadingState,
        builder: (context, state) {
          if (state is GetDoctorReviewsSuccessState) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' تقييمات الدكتور',
                    style: TextStyles.bold16,
                  ),
                  verticalSpace(8),
                  if (state.reviews.isEmpty)
                    const Text('لا يوجد تقييمات حتى الان',
                        style: TextStyles.semiBold16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.reviews.length,
                    itemBuilder: (context, index) =>
                        CustomDoctorReviewItem(
                      review: state.reviews[index],
                    ),
                  )
                ]);
          } else if (state is GetDoctorReviewsFailureState) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}


