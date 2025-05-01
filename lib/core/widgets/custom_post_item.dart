import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/custom_box_decoration.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/core/widgets/custom_doctor_post_details.dart';
import 'package:nafsia/core/widgets/custom_post_actions.dart';
import 'package:nafsia/core/widgets/custom_post_image.dart';
import 'package:nafsia/features/home/domain/models/posts_model.dart';

class CustomPostItem extends StatelessWidget {
  final PostModel postModel;
  const CustomPostItem({
    super.key,
    required this.postModel,
  });

  @override
  Widget build(BuildContext context) {
    

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: customBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDoctorPostDetails(
              doctorData: postModel.doctor,
              createdAt: postModel.createdAt,
            ),
            verticalSpace(12),
            Text(
              postModel.title,
              style: TextStyles.bold16,),
              verticalSpace(8),
             Text(
              postModel.content,
              style: TextStyles.regular16,
            ),
            verticalSpace(16),
            postModel.images.isEmpty ? Container() : CustomPostImage(imagePath: postModel.images.first.secureUrl,),
            verticalSpace(12),
             CustomPostActions(postModel: postModel,)
          ],
        ),
      ),
    );
  }
}
