import 'package:plant_scan/constants/const.dart';
import 'package:plant_scan/screens/aiChat.dart';
import 'package:plant_scan/screens/homeScreen.dart';
import 'package:plant_scan/screens/userProfile.dart';
import 'package:plant_scan/screens/yourSavesScreen.dart';
import 'package:flutter/material.dart';

class ScreenNavLayout extends StatefulWidget {
  const ScreenNavLayout({super.key});

  @override
  State<ScreenNavLayout> createState() => _ScreenNavLayoutState();
}

class _ScreenNavLayoutState extends State<ScreenNavLayout> {
  PageController? _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onBottomNavTapped(int index) {
    _pageController?.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _goBack() {
    if (_pageController?.page != 0) {
      _pageController?.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          HomeScreen(
            drawerTo: () => _onBottomNavTapped,
            goToProfile: () => _onBottomNavTapped(3),
          ),
          AiChat(
            goBack: _goBack,
          ),
          YourSaves(
            goBack: _goBack,
          ),
          UserProfile(
            goBack: _goBack,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -4),
              color: Colors.black.withOpacity(.4),
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomAppBar(
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomNavItem(Icons.home, 'Home', 0),
              _buildBottomNavItem(Icons.chat, 'AI Chat', 1),
              _buildBottomNavItem(Icons.bookmark_outline_outlined, 'Saves', 2),
              _buildBottomNavItem(Icons.person_4_rounded, 'Profile', 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label, int index) {
    bool isSelected = index == _currentIndex;

    return InkWell(
      onTap: () => _onBottomNavTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 26,
            color: isSelected ? buttonColor : const Color(0xFFB2B2B2),
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? buttonColor : const Color(0xFFB2B2B2),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
