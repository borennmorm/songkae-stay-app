import 'package:get/get.dart';
import 'package:room_rental_app/features/auth/login.dart';
import 'package:room_rental_app/shared/widgets/landlord_loggon_bottom_nav.dart';

class Routes {
  static const String default_navigation = '/navigation';
  static const String login = '/login';

  static List<GetPage> pages = [
    GetPage(
      name: default_navigation,
      page: () => const LandlordLoggonBottomNav(),
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
    ),
  ];
}
