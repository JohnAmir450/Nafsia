import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/custom_box_decoration.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/doctor_main_detais_card.dart';

class FeaturedDoctorChatsViewItem extends StatelessWidget {
  const FeaturedDoctorChatsViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height *0.12,
      maxWidth: MediaQuery.of(context).size.width *
          0.4, 
      minWidth:
          250, 
    ),
    padding: EdgeInsets.all(
        MediaQuery.of(context).size.width * 0.03), // Adaptive padding
    decoration: customBoxDecoration(opacity: 0.08),
    child: const DoctorMainDetailsCard(),
                );
  }
}
