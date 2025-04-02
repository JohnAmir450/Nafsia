import 'package:flutter/material.dart';
import 'package:nafsia/core/helper_functions/extentions.dart';
import 'package:nafsia/core/widgets/custom_app_bar.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/doctors_view_body.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,
          title: 'الاخصائيين', onTap: () => context.pop()),
      body: const DoctorsViewBody(),
    );
  }
}

