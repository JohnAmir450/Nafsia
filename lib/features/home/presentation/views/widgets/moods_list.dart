import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/app_colors.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../domain/entities/mood_item_entity.dart';

class MoodsList extends StatelessWidget {
  final String? selectedMood;
  final ValueChanged<String> onMoodSelected;

  const MoodsList({
    super.key,
    required this.selectedMood,
    required this.onMoodSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: moodEntityList.map((item) {
        return GestureDetector(
          onTap: () => onMoodSelected(item.title),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 3,
                color: selectedMood == item.title
                    ? AppColors.primaryColor
                    : Colors.transparent,
              ),
            ),
            child: Column(
              children: [
                Image.asset(
                  item.image,
                  height: MediaQuery.of(context).size.width * 0.15,
                  width: MediaQuery.of(context).size.width * 0.15,
                ),
                Text(
                  item.title,
                  style: TextStyles.bold16.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}