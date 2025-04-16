import 'package:flutter/material.dart';
import 'package:nafsia/features/home/presentation/views/chats_view.dart';
import 'package:nafsia/features/home/presentation/views/home_view.dart';
import 'package:nafsia/features/home/presentation/views/more_view.dart';
import 'package:nafsia/features/home/presentation/views/widgets/custom_buttom_navigation_bar.dart';
import 'package:nafsia/features/home/presentation/views/widgets/group_chats_widgets/group_chats_view_body.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomButtonNavigationBar(
          onItemTapped: _onItemTapped,
          selectedIndex: selectedIndex,
        ),
        body: IndexedStack(
          index: selectedIndex,
          children: const [
            HomeView(),
            ChatsView(),
            GroupChatsViewBody(),
            MoreView(),
          ],
        ),
      ),
    );
  }
}
