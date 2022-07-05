import 'package:get/get.dart';

import '../controllers/screen_splash_controller.dart';

class ScreenSplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenSplashController>(
      () => ScreenSplashController(),
    );
  }
}
