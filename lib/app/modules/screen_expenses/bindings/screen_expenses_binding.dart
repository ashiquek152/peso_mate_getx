import 'package:get/get.dart';

import '../controllers/screen_expenses_controller.dart';

class ScreenExpensesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenExpensesController>(
      () => ScreenExpensesController(),
    );
  }
}
