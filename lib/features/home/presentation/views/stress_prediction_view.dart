import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/helper_functions/extentions.dart';
import 'package:nafsia/core/services/get_it_service.dart';
import 'package:nafsia/core/widgets/custom_app_bar.dart';
import 'package:nafsia/features/home/domain/repos/home_repo.dart';
import 'package:nafsia/features/home/manager/home_cubit/home_cubit.dart';
import 'package:nafsia/features/home/presentation/views/widgets/more_views_widgets/stress_prediction_view_body.dart';

class StressPredictionView extends StatelessWidget {
  const StressPredictionView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomeCubit(getIt<HomeRepo>()),
        child: Scaffold(
          appBar: buildAppBar(context,
              title: 'تنبؤ بنسبة الضغط النفسي', onTap: () => context.pop()),
          body: const StressPredictionViewBody(),
        ),
      ),
    );
  }
}
