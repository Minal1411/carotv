import 'package:carotv/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar(this.selectedIndex, this.onItemTapped, {super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.primary,
      unselectedItemColor: Colors.white.withOpacity(0.6),
      selectedItemColor: AppColors.classicYellow,
      currentIndex: selectedIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: onItemTapped,
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home_outlined, size: 34.w),
        ),
        BottomNavigationBarItem(
          label: 'Search',
          icon: Icon(Icons.search, size: 34.w),
        ),
        BottomNavigationBarItem(
          label: 'Live TV',
          icon: Icon(Icons.live_tv, size: 34.w),
        ),
        BottomNavigationBarItem(
          label: 'More',
          icon: Icon(Icons.more_horiz_sharp, size: 34.w),
        ),
      ],
    );
  }
}
