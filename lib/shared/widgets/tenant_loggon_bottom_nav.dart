import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:room_rental_app/features/chat/messege_screen.dart';
import 'package:room_rental_app/features/home/home_screen.dart';
import 'package:room_rental_app/features/settings/tenant/setting_screen.dart';
import 'package:room_rental_app/shared/widgets/custom_google_map.dart';

class TenantLoggonBottomNav extends StatefulWidget {
  const TenantLoggonBottomNav({super.key});

  @override
  _TenantLoggonBottomNavState createState() => _TenantLoggonBottomNavState();
}

class _TenantLoggonBottomNavState extends State<TenantLoggonBottomNav> {
  int _selectedIndex = 0;

  // List of pages corresponding to each index (all widgets instantiated)
  final List<Widget> _pages = [
    const HomeScreen(),
    MapViews(),
    const MessageScreen(),
    const TenantSettingsScreen(), 
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.setting),
            label: 'Setting',
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF002352),
        onTap: _onItemTapped, // Added the onTap property
      ),
    );
  }
}
