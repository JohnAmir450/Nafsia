import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';

class EmptyMoodsList extends StatelessWidget {
  const EmptyMoodsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.sentiment_dissatisfied,
              size: 50, color: Colors.grey),
          const SizedBox(height: 10),
          Text(
            "لا يوجد مزاج مسجل بعد",
            style: TextStyles.bold16
                .copyWith(color: Colors.black54),
          ),
        ],
      );
  }
}
