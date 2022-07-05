import 'package:get/get.dart';

import '../controllers/screen_incomes_controller.dart';

class ScreenIncomesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenIncomesController>(
      () => ScreenIncomesController(),
    );
  }
}
