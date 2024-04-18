import 'package:flutter_metatube_app/pages/home_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const HOMEPAGEROUTE = "/home";

  static final routes = [
    GetPage(
      name: HOMEPAGEROUTE,
      page: () => const HomePage(),
    ),
  ];
}
