import 'package:get/get.dart';

class ScreenStaticsController extends GetxController {

//   final count = 0.obs;
//   @override
//   void onInit() {
//     super.onInit();
//   }

//   @override
//   void onReady() {
//     super.onReady();
//   }

//   @override
//   void onClose() {
//     super.onClose();
//   }

  RxBool page = true.obs;
  RxString statDropDownValue = 'Income'.obs;
  RxInt statIndex = 1.obs;

  final List items =['Income', 'Expense'];

}


  // body: Stack(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: SingleChildScrollView(
      //         child: Column(
      //           children: [
      //             DropDownListandButtons(),
      //             sizedH20,
      //           ],
      //         ),
      //       ),
      //     ),
      //     CustomPaint(
      //       painter: MyPainter(),
      //       child: Container(height: 0),
      //     ),
      //   ],
    