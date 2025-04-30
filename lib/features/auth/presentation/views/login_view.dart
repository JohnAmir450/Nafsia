import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:nafsia/core/services/get_it_service.dart';
import 'package:nafsia/features/auth/data/login_cubit/login_cubit.dart';
import 'package:nafsia/features/auth/logic/repos/auth_repo.dart';
import 'package:nafsia/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
        create: (context) => LoginCubit(getIt<AuthRepo>()),
        child: const LoginViewBody(),
      )),
    );
  }
}
