import 'package:flutter_metatube_app/controllers/home_controller.dart';
import 'package:flutter_metatube_app/controllers/splash_controller.dart';
import 'package:get/get.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(HomeController());
  }
}
