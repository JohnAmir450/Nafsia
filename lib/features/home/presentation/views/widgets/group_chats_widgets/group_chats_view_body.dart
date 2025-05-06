import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/constants.dart';
import 'package:nafsia/features/home/presentation/views/widgets/custom_main_view_app_bar.dart';
import 'package:nafsia/features/home/presentation/views/widgets/group_chats_widgets/group_chat_card_item.dart';

class GroupChatsViewBody extends StatefulWidget {
  const GroupChatsViewBody({super.key});

  @override
  State<GroupChatsViewBody> createState() => _GroupChatsViewBodyState();
}

class _GroupChatsViewBodyState extends State<GroupChatsViewBody> {
  int currentPage = 0;
  final PageController _pageController = PageController();

  void onToggleTap(int index) {
    setState(() {
      currentPage = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  Widget buildToggle() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onToggleTap(0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: currentPage == 0 ? AppColors.primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'كل المجموعات',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: currentPage == 0 ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onToggleTap(1),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: currentPage == 1 ? Colors.blue : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'مجموعاتي',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: currentPage == 1 ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGroupList({required bool isMyGroups}) {
    // Replace with your actual filtering logic
    final itemCount = isMyGroups ? 3 : 10;

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (context, index) => const GroupChatCardItem(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
        vertical: kVerticalPadding,
      ),
      child: Column(
        children: [
          const CustomMainViewsAppBar(title: 'مجموعات الدعم'),
          buildToggle(),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) => setState(() => currentPage = index),
              children: [
                buildGroupList(isMyGroups: false), // كل المجموعات
                buildGroupList(isMyGroups: true),  // مجموعاتي
              ],
            ),
          ),
        ],
      ),
    );
  }
}
