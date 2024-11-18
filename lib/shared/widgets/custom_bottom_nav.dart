import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:room_rental_app/features/auth/login.dart';
import 'package:room_rental_app/features/chat/chat_screen.dart';
import 'package:room_rental_app/features/home/home_screen.dart';
import 'package:room_rental_app/shared/widgets/custom_google_map.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 3) {
      // Navigate to UserScreen when the user icon is tapped
      Get.to(() => const LoginScreen());
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  // List of pages corresponding to each index (excluding UserScreen)
  final List<Widget> _pages = [
    const HomeScreen(),
    MapViews(),
    const ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex < 3 ? _pages[_selectedIndex] : Container(),
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
            icon: Icon(Iconsax.user),
            label: 'User',
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF002352),
      ),
    );
  }
}
