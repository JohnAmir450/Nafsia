import 'package:flutter/material.dart';
import 'package:nafsia/features/home/presentation/views/home_view.dart';
import 'package:nafsia/features/home/presentation/views/widgets/custom_buttom_navigation_bar.dart';

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
    return  Scaffold(
      bottomNavigationBar: CustomButtonNavigationBar(onItemTapped: _onItemTapped,selectedIndex: selectedIndex,),
      body: IndexedStack(
        index: selectedIndex,
        children: [
         HomeView(),
          Center(child: Text('Search'),),
          Center(child: Text('Notifications'),),
          Center(child: Text('Profile'),),
        ],
      ),
    );
  }
}