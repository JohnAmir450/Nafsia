import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/helper_functions/get_dummy_my_appoitments.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/custom_snak_bar.dart';
import 'package:nafsia/core/widgets/my_divider.dart';
import 'package:nafsia/features/home/manager/doctors_cubit/doctors_cubit.dart';
import 'package:nafsia/features/home/presentation/views/widgets/more_views_widgets/private_session_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyPrivateSessionsViewBody extends StatelessWidget {
  const MyPrivateSessionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorsCubit, DoctorsState>(
      listener: (context, state) {
        if (state is GetBookedPrivateSessionsFailureState) {
          showSnackBar(context, text: state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is GetBookedPrivateSessionsLoadingState) {
          return Skeletonizer(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: 10,
              separatorBuilder: (_, __) => const MyDivider(),
              itemBuilder: (context, index) {
                return PrivateSessionItem(
                    session: getDummyMyPrivateSessions(),
                    allSessions: List.generate(
                        1, (index) => getDummyMyPrivateSessions()));
              },
            ),
          );
        }

        if (state is GetBookedPrivateSessionsSuccessState) {
          final groupedSessions =
              state.appointments; // List<List<SessionsModel>>

          if (groupedSessions.isEmpty) {
            return const Center(
              child: Text('لا توجد جلسات محجوزة حتى الآن',
                  style: TextStyles.semiBold16),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: groupedSessions.length,
            separatorBuilder: (_, __) => const MyDivider(),
            itemBuilder: (context, index) {
              final sessionsGroup = groupedSessions[index];
              final firstSession = sessionsGroup.first;
              
              return PrivateSessionItem(
                  session: firstSession, allSessions: sessionsGroup);
            },
          );
        }

        if (state is GetBookedPrivateSessionsFailureState) {
          return Center(
            child: Text('حدث خطأ أثناء تحميل الجلسات : ${state.errorMessage}',
                style: TextStyles.semiBold16),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
