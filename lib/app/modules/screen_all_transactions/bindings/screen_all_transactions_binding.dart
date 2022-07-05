import 'package:get/get.dart';

import '../controllers/screen_all_transactions_controller.dart';

class ScreenAllTransactionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenAllTransactionsController>(
      () => ScreenAllTransactionsController(),
    );
  }
}
