import 'package:flutter_metatube_app/pages/home_page.dart';
import 'package:flutter_metatube_app/pages/splash_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  /// Route constant for the home page
  static const splashPageRoute = "/splash";
  static const homePageRoute = "/home";

  /// List of the routes for the application
  static final List<GetPage> routes = [
    GetPage(
      name: splashPageRoute,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: homePageRoute,
      page: () => const HomePage(),
    ),
  ];
}
