import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/services/get_it_service.dart';
import 'package:nafsia/features/home/domain/repos/home_repo.dart';
import 'package:nafsia/features/home/manager/doctors_cubit/doctors_cubit.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/chats_view_body.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorsCubit(getIt<HomeRepo>())..getAllDoctors(),
      child: const ChatsViewBody(),
    );
  }
}
