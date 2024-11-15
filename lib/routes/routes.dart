import 'package:get/get.dart';
import 'package:room_rental_app/features/map/map_screen.dart';
import 'package:room_rental_app/features/home/home_screen.dart';
import 'package:room_rental_app/shared/widgets/custom_bottom_nav.dart';

import '../features/started/splash.dart';

class Routes {
  static const home = '/home';
  static const map = '/map';
  static const message = '/message';
  static const default_navigation = '/navigation';
  static const splash = '/splash';

  static List<GetPage> pages = [
    GetPage(name: home, page: () => const MapScreen()),
    GetPage(name: map, page: () => const HomeScreen()),
    GetPage(name: default_navigation, page: () => const CustomBottomNavigationBar()),
    GetPage(name: splash, page: () => const SplashScreen()),
  ];
}
