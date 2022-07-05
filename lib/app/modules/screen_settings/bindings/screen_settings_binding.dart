import 'package:get/get.dart';

import '../controllers/screen_settings_controller.dart';

class ScreenSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenSettingsController>(
      () => ScreenSettingsController(),
    );
  }
}
