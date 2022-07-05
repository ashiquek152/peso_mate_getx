import 'package:get/get.dart';

import '../controllers/screen_statics_controller.dart';

class ScreenStaticsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenStaticsController>(
      () => ScreenStaticsController(),
    );
  }
}
