import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/services/get_it_service.dart';
import 'package:nafsia/features/home/domain/models/doctor_model.dart';
import 'package:nafsia/features/home/domain/repos/home_repo.dart';
import 'package:nafsia/features/home/manager/doctors_cubit/doctors_cubit.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/doctor_profile_view_body.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/doctor_profile_view_sliver_app_bar.dart';

class DoctorProfileView extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorProfileView({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => DoctorsCubit(getIt<HomeRepo>())
          ..getDoctorAppointments(doctorId: doctor.id)..getDoctorReviews(doctorId: doctor.id),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              DoctorProfileViewSliverAppBar(doctor: doctor),
              DoctorProfileViewBody(
                doctor: doctor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
