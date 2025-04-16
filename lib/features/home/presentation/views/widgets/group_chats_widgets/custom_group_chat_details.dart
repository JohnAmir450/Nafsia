import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';

class GroupChatCardDetailsSection extends StatelessWidget {
  final String title;
  final String trailing;
  final IconData icon;
  const GroupChatCardDetailsSection({
    super.key,
    required this.title,
    required this.trailing,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryColor),
      title: Text(title, style: TextStyles.semiBold16),
      trailing: Text(
       trailing,
        style: TextStyles.semiBold16,
      ),
    );
  }
}