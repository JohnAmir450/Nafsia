import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/features/home/manager/communiity_sessions_cubit/community_sessions_cubit.dart';

class GroupChatsToggleButtonsViewBody extends StatelessWidget {
  const GroupChatsToggleButtonsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CommunitySessionsCubit>();
    final currentPage = cubit.currentPage;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: List.generate(2, (index) {
          final isSelected = currentPage == index;
          final titles = ['كل المجموعات', 'مجموعاتي'];

          return Expanded(
            child: GestureDetector(
              onTap: () {
                cubit.togglePage(index);
                
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color:
                      isSelected ? AppColors.primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  titles[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
