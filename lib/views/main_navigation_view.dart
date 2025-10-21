import 'package:assignment/widgets/navigation/glass_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:assignment/views/home_view.dart';
import 'package:assignment/views/diary_view.dart';
import 'package:assignment/views/diet_view.dart';
import 'package:assignment/views/progress_view.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Main content
          IndexedStack(
            index: _currentIndex,
            children: [
              const DashboardGlassUI(),
              DiaryView(currentIndex: _currentIndex, onTap: _onTabTapped),
              DietView(currentIndex: _currentIndex, onTap: _onTabTapped),
              ProgressView(currentIndex: _currentIndex, onTap: _onTabTapped),
            ],
          ),
          // Floating bottom navigation
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                GlassBottomNavBar(
                  currentIndex: _currentIndex,
                  onTap: _onTabTapped,
                ),
                // Elevated center button
                Positioned(
                  top: -30,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: const GlowingCenterButton(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
