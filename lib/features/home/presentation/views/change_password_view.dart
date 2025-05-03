import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/helper_functions/extentions.dart';
import 'package:nafsia/core/services/get_it_service.dart';
import 'package:nafsia/core/widgets/custom_app_bar.dart';
import 'package:nafsia/features/auth/logic/repos/auth_repo.dart';
import 'package:nafsia/features/home/manager/more_cubit/more_cubit.dart';
import 'package:nafsia/features/home/presentation/views/widgets/more_views_widgets/change_password_view_body.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoreCubit( getIt<AuthRepo>(),),
      child: Scaffold(
        appBar: buildAppBar(context,
            title: 'إعادة تعيين كلمة المرور', onTap: () => context.pop()),
        body: ChangePasswordViewBody(),
      ),
    );
  }
}
