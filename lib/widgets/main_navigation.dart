import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:travel_app/features/home/home_screen.dart';
import 'package:travel_app/features/bookings/booking_screen.dart';
import 'package:travel_app/features/settings/settings_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation>
    with TickerProviderStateMixin {
  int _bottomNavIndex = 0;
  late AnimationController _animationController;

  final List<IconData> iconList = [
    Icons.home,
    Icons.bookmark,
    Icons.settings,
  ];

  final List<String> titleList = [
    'Home',
    'Bookings',
    'Settings',
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const BookingScreen();
      case 2:
        return const SettingsScreen();
      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPage(_bottomNavIndex),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
        gapLocation: GapLocation.none,
        activeColor: Colors.black,
        inactiveColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 8,
        height: 70,
      ),
    );
  }
}

