import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/features/home/domain/models/doctor_model.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/doctor_profile_view_body_header_details.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/doctors_view_body_details_section_and_appointments.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/reviews_section_bloc_builder.dart';
import 'package:timeago/timeago.dart' as timeago;

class DoctorProfileViewBody extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorProfileViewBody({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    print(doctor.id);
    timeago.setLocaleMessages('ar', timeago.ArMessages());
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DoctorProfileViewBodyHeaderDetails(
              doctor: doctor,
            ),
            verticalSpace(30),
            const DoctorProfileViewBodyDetailsAndAppointmentsSection(),
            verticalSpace(16),
            const ReviewsSectionBlocBuilder()
          ],
        ),
      ),
    );
  }
}
