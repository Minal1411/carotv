import 'package:carotv/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar(this.selectedIndex, this.onItemTapped, {super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.secondary,
      unselectedItemColor: Colors.black.withOpacity(0.4),
      selectedItemColor: AppColors.classicYellow,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home_outlined, size: 20),
        ),
        BottomNavigationBarItem(
          label: 'Live TV',
          icon: Icon(Icons.live_tv, size: 20),
        ),
        BottomNavigationBarItem(
          label: 'Movies',
          icon: Icon(Icons.movie_filter_outlined, size: 20),
        ),
        BottomNavigationBarItem(
          label: 'Shows',
          icon: Icon(Icons.slideshow_sharp, size: 20),
        ),
      ],
    );
  }
}
