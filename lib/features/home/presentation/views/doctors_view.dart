import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/helper_functions/extentions.dart';
import 'package:nafsia/core/services/get_it_service.dart';
import 'package:nafsia/core/widgets/custom_app_bar.dart';
import 'package:nafsia/features/home/domain/repos/home_repo.dart';
import 'package:nafsia/features/home/manager/doctors_cubit/doctors_cubit.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/doctors_view_body.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,
          title: 'الاخصائيين', onTap: () => context.pop()),
      body: BlocProvider(
        create: (context) => DoctorsCubit(getIt<HomeRepo>())..getAllDoctors(),
        child: const DoctorsViewBody(),
      ),
    );
  }
}
