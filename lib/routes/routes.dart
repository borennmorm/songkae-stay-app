import 'package:get/get.dart';
import 'package:room_rental_app/features/home/home_screen.dart';
import 'package:room_rental_app/shared/widgets/custom_buttom_nav.dart';

class Routes {
  static const home = '/home';
  static const navigation = '/navigation';

  static List<GetPage> pages = [
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: navigation, page: () => const CustomBottomNavigationBar()),
  ];
}
