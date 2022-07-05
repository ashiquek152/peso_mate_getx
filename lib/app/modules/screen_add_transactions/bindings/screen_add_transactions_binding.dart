import 'package:get/get.dart';

import '../controllers/screen_add_transactions_controller.dart';

class ScreenAddTransactionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenAddTransactionsController>(
      () => ScreenAddTransactionsController(),
    );
  }
}
