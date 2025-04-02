import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/core/widgets/search_text_field.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/custom_doctor_details_card.dart';

class DoctorsViewBody extends StatelessWidget {
  const DoctorsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SearchTextField(),
          verticalSpace(24),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => const CustomDoctorDetailsCard(),
              itemCount: 10),
        ],
      ),
    );
  }
}
