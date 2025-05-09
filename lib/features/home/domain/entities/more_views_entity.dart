import 'package:flutter/material.dart';
import 'package:nafsia/core/helper_functions/extentions.dart';
import 'package:nafsia/core/helper_functions/rouutes.dart';

class MoreViewsEntity {
  final String text;
  final void Function(BuildContext context)? onTap;
  final IconData icon;
  final Color? cardColor;

  MoreViewsEntity({
    required this.text,
    required this.onTap,
    required this.icon,
    this.cardColor,
  });
}

List<MoreViewsEntity> moreViewsList = [
  MoreViewsEntity(
    text: 'الملف الشخصي',
    onTap: (context) => context.pushNamed(Routes.userProfileView),
    icon: Icons.person,
  ),
  MoreViewsEntity(
    text: 'العناصر المحفوظة',
    onTap: (context) => context.pushNamed(Routes.savedPostsView),
    icon: Icons.bookmark_rounded,
  ),
];
