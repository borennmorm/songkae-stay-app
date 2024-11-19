import 'package:get/get.dart';
import 'package:room_rental_app/features/map/map_screen.dart';
import 'package:room_rental_app/features/home/home_screen.dart';
import 'package:room_rental_app/shared/widgets/custom_bottom_nav.dart';
import 'package:room_rental_app/shared/widgets/landlord_loggon_bottom_nav.dart';
import 'package:room_rental_app/shared/widgets/tenant_loggon_bottom_nav.dart';

class Routes {
  static const home = '/home';
  static const map = '/map';
  static const message = '/message';
  static const default_navigation = '/navigation';
  static const tenant_navigation = '/tenant_navigation';
  static const landlord_navigation = '/landlord_navigation';

  static List<GetPage> pages = [
    GetPage(name: home, page: () => const MapScreen()),
    GetPage(name: map, page: () => const HomeScreen()),
    GetPage(
        name: default_navigation,
        page: () => const CustomBottomNavigationBar()),
    GetPage(name: tenant_navigation, page: () => const TenantLoggonBottomNav()),
    GetPage(
        name: landlord_navigation, page: () => const LandlordLoggonBottomNav()),
  ];
}
