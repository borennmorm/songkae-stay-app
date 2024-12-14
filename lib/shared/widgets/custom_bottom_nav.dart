import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:room_rental_app/features/auth/login.dart';
import 'package:room_rental_app/features/home/home_screen.dart';
import 'package:room_rental_app/features/notification/notification_screen.dart';
import 'package:room_rental_app/features/settings/profile_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      // const RoomsScreen(),
      const LoginScreen(),
      const NotificationScreen(),
      const EditProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.home),
        title: "Home",
        activeColorPrimary: const Color(0xFF002352),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.building_4),
        title: "Rooms",
        activeColorPrimary: const Color(0xFF002352),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color(0xFF002352),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Iconsax.add,
            color: Colors.white,
          ),
        ),
        title: "",
        activeColorPrimary: Colors.transparent,
        inactiveColorPrimary: Colors.transparent,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.notification),
        title: "Notifications",
        activeColorPrimary: const Color(0xFF002352),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.user),
        title: "Profile",
        activeColorPrimary: const Color(0xFF002352),
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor: Colors.white,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.zero,
      ),
      navBarStyle: NavBarStyle.style6,
      onItemSelected: (index) {
        setState(() {
          _controller.index = index;
        });
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
