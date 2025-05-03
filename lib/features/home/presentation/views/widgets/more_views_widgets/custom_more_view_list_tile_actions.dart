import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafsia/core/helper_functions/extentions.dart';
import 'package:nafsia/core/helper_functions/rouutes.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/features/home/presentation/views/widgets/more_views_widgets/custom_more_view_list_tile_item.dart';

class CustomMoreViewListTileActions extends StatelessWidget {
  const CustomMoreViewListTileActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomMoreViewListTileItem(
            title: Text(
              'تعديل الملف الشخصي',
              style: TextStyles.bold16,
            ),
            leading: const Icon(
              Icons.person,
              color: AppColors.primaryColor,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.primaryColor,
            ),
            onTap: () => context.pushNamed(Routes.userProfileView),
          ),
          const Divider(),
          CustomMoreViewListTileItem(
              title: Text(
                'تغيير كلمة المرور',
                style: TextStyles.bold16,
              ),
              leading: const Icon(
                Icons.lock,
                color: AppColors.primaryColor,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.primaryColor,
              )),
          const Divider(),
          CustomMoreViewListTileItem(
            title: Text(
              'المنشورات المحفوظة',
              style: TextStyles.bold16,
            ),
            leading: const Icon(
              Icons.bookmark,
              color: AppColors.primaryColor,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.primaryColor,
            ),
            onTap: () {
              context.pushNamed(Routes.savedPostsView);
            },
          ),
          const Divider(),
    
          // Log Out
          CustomMoreViewListTileItem(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: Text('تسجيل الخروج',
                style: TextStyles.bold16.copyWith(color: Colors.red)),
            onTap: () {
              // Log out logic
            },
          ),
          const Divider(),
    
          // Delete Account
          CustomMoreViewListTileItem(
            leading: const Icon(Icons.delete_forever, color: Colors.red),
            title: Text('حذف الحساب',
                style: TextStyles.bold16.copyWith(color: Colors.red)),
            onTap: () {},
          ),
          verticalSpace(24.h)
        ],
      ),
    );
  }
}