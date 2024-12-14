import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:room_rental_app/features/tenants/tenants_management_screen.dart';
import 'package:room_rental_app/features/home/home_screen.dart';
import 'package:room_rental_app/features/dashboard/landlord/dashboard_screen.dart';
import 'package:room_rental_app/features/settings/landlord/setting_screen.dart';
import 'package:room_rental_app/features/settings/tenant/setting_screen.dart';
import 'package:room_rental_app/shared/widgets/custom_google_map.dart';

class LandlordLoggonBottomNav extends StatefulWidget {
  const LandlordLoggonBottomNav({super.key});

  @override
  _LandlordLoggonBottomNavState createState() => _LandlordLoggonBottomNavState();
}

class _LandlordLoggonBottomNavState extends State<LandlordLoggonBottomNav> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const MapViews(),
      const LandlordDashboardScreen(),
      const TenantsManagementScreen(),
      const LandloardSettingsScreen(),
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
        icon: const Icon(Iconsax.map),
        title: "Map",
        activeColorPrimary: const Color(0xFF002352),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.chart),
        title: "Dashboard",
        activeColorPrimary: const Color(0xFF002352),
        inactiveColorPrimary: Colors.grey,
        activeColorSecondary: Colors.white,
        inactiveColorSecondary: Colors.white,
        contentPadding: 10,
        
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.user),
        title: "Tenants",
        activeColorPrimary: const Color(0xFF002352),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.setting),
        title: "Settings",
        activeColorPrimary: const Color(0xFF002352),
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      padding: const EdgeInsets.symmetric(vertical: 5),
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
