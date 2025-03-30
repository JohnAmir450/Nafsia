import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nafsia/core/helper_functions/extentions.dart';
import 'package:nafsia/core/helper_functions/rouutes.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              Text('اهلًا بك مريم 👋',style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),),
              Spacer(),
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
              )
      
            ],
          )
        ],
      ),
    );
  }
}