import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/core/widgets/custom_cached_network_image.dart';
import 'package:nafsia/features/home/domain/models/community_messages_model.dart';
import 'package:nafsia/features/home/domain/models/doctor_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class DoctorMessageBubble extends StatelessWidget {
  final DoctorModel doctorDataModel;
  final CommunityMessageModel communityMessageModel;

  const DoctorMessageBubble(
      {super.key,
      required this.doctorDataModel,
      required this.communityMessageModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Doctor Image
        CustomCachedNetworkImageWidget(
          borderRadius: 16,
          imageUrl: doctorDataModel.avatarUrl,
          height: 50,
          width: 50,
          fit: BoxFit.fill,
        ),
       horizontalSpace(8),
        // Message Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctorDataModel.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              horizontalSpace(8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),),
                ),
                child: Text(communityMessageModel.message),
              ),
              verticalSpace(3),
              Text(
                timeago.format(communityMessageModel.createdAt, locale: 'ar'),
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}