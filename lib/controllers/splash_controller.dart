import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    _navigateToMainPage();
  }

  Future<void> _navigateToMainPage() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    
    Get.offAllNamed('/home');
  }
}
