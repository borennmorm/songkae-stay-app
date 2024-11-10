import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:room_rental_app/features/chat/messege_screen.dart';
import 'package:room_rental_app/features/home/home_screen.dart';

import '../../features/Map/map_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // List of pages corresponding to each index
  final List<Widget> _pages = [
    const HomeScreen(),
    const MapScreen(),
    const MessageScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
            icon: Icon(Iconsax.setting_2),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
      ),
    );
  }
}
