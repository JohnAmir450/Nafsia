import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafsia/core/helper_functions/get_user_data.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/features/home/presentation/views/widgets/more_views_widgets/custom_all_user_information.dart';
import 'package:nafsia/features/home/presentation/views/widgets/more_views_widgets/custom_more_view_header.dart';
import 'package:nafsia/features/home/presentation/views/widgets/more_views_widgets/custom_more_view_list_tile_actions.dart';

class MoreViewBody extends StatelessWidget {
  const MoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final user = getUserData().user;
    return SingleChildScrollView(
      child: Column(
        children: [
          // Profile Header
          CustomMoreViewHeader(user: user),
          verticalSpace(32),
          // Info Tiles
          CustomAllUserInformation(user: user),
          verticalSpace(20),
          Divider(
            indent: 20.w,
            endIndent: 20.w,
          ),
          // User Actions
          const CustomMoreViewListTileActions(),
        ],
      ),
    );
  }
}
