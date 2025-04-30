import 'package:flutter/material.dart';
import 'package:nafsia/core/helper_functions/extentions.dart';
import 'package:nafsia/core/helper_functions/get_user_data.dart';
import 'package:nafsia/core/helper_functions/rouutes.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('اهلًا بك ${getUserData().user.name} 👋',style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),),
        const Spacer(),
        GestureDetector(
          onTap: (){
            context.pushNamed(Routes.modeSelectionView);
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(16)
            ),
            child: Text('كيف تشعر اليوم ؟ 😀',style: TextStyles.bold13,)),
        ),
        IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_rounded),color: AppColors.primaryColor,)
          
      ],
    );
  }
}