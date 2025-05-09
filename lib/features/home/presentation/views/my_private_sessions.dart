import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/services/get_it_service.dart';
import 'package:nafsia/features/home/domain/repos/home_repo.dart';
import 'package:nafsia/features/home/manager/doctors_cubit/doctors_cubit.dart';
import 'package:nafsia/features/home/presentation/views/widgets/more_views_widgets/my_private_session_view_body.dart';

class MyPrivateSessionsView extends StatelessWidget {
  const MyPrivateSessionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مواعيدي'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            DoctorsCubit(getIt<HomeRepo>())..getBookedPrivateSessions(),
        child: const MyPrivateSessionsViewBody(),
      ),
    );
  }
}


