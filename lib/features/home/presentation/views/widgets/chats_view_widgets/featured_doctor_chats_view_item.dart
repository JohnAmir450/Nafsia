import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/custom_box_decoration.dart';
import 'package:nafsia/features/home/domain/models/doctor_model.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/doctor_main_detais_card.dart';

class FeaturedDoctorChatsViewItem extends StatelessWidget {
  final DoctorModel doctor;
  const FeaturedDoctorChatsViewItem({
    super.key, required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height *0.12,
      maxWidth: MediaQuery.of(context).size.width *
          0.6, 
      minWidth:
           MediaQuery.of(context).size.width *
          0.5, 
    ),
    padding: EdgeInsets.all(
        MediaQuery.of(context).size.width * 0.03), // Adaptive padding
    decoration: customBoxDecoration(opacity: 0.08),
    child:  DoctorMainDetailsCard(doctor: doctor,),
                );
  }
}
