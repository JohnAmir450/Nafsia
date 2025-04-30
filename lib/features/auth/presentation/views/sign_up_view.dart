import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/helper_functions/extentions.dart';
import 'package:nafsia/core/services/get_it_service.dart';
import 'package:nafsia/core/widgets/custom_app_bar.dart';
import 'package:nafsia/features/auth/data/sign_up_cubit/sign_up_cubit.dart';
import 'package:nafsia/features/auth/logic/repos/auth_repo.dart';
import 'package:nafsia/features/auth/presentation/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'انشاء حساب',
        onTap: () => context.pop(),
      ),
      body: BlocProvider(
        create: (context) =>SignUpCubit(getIt<AuthRepo>()) ,
        child: const SignUpViewBody(),
      ),
    );
  }
}
