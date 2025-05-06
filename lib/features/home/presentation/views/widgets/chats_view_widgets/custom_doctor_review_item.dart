import 'package:flutter/material.dart';
import 'package:nafsia/core/models/reveiew_model.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:timeago/timeago.dart' as timeago;

class CustomDoctorReviewItem extends StatelessWidget {
  final ReviewModel review;
  const CustomDoctorReviewItem({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          ListTile(
            title: Text(
              review.userData.name
                  .replaceRange(3, review.userData.name.length, '*'),
              style: TextStyles.bold13,
            ),
            subtitle: Text(
              timeago.format(review.createdAt, locale: 'ar'),
              style: TextStyles.semiBold13.copyWith(color: Colors.grey),
            ),
            trailing: Text(
              '${review.rating}/5⭐',
              style: TextStyles.bold16,
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width - 100,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Text(
              review.comment,
              style: TextStyles.bold13,
            ),
          )
        ],
      ),
    );
  }
}
