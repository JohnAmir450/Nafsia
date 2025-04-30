import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/helper_functions/extentions.dart';
import 'package:nafsia/core/services/get_it_service.dart';
import 'package:nafsia/core/widgets/custom_app_bar.dart';
import 'package:nafsia/features/auth/data/forget_password_cubit/forget_password_cubit.dart';
import 'package:nafsia/features/auth/logic/repos/auth_repo.dart';
import 'package:nafsia/features/auth/presentation/views/widgets/verify_otp_view_body.dart';

class VerifyOtpView extends StatelessWidget {
  final String email;
  const VerifyOtpView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgetPasswordCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context,
            title: 'التحقق من الرمز', onTap: () => context.pop()),
        body: VerifyOtpViewBody(email: email),
      ),
    );
  }
}



