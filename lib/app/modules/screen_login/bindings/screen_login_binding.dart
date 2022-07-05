import 'package:get/get.dart';

import '../controllers/screen_login_controller.dart';

class ScreenLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenLoginController>(
      () => ScreenLoginController(),
    );
  }
}
