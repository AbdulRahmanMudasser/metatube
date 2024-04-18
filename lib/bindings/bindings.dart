import 'package:flutter_metatube_app/controllers/home_controller.dart';
import 'package:get/get.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
