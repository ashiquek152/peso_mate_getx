import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peso_mate_getx/app/data/db_helper/db_helper.dart';
import 'package:peso_mate_getx/app/data/widgets/colors.dart';
import 'package:peso_mate_getx/app/data/widgets/fl_chart/fl_chart.dart';
import 'package:peso_mate_getx/app/data/widgets/painter_class.dart';
import 'package:peso_mate_getx/app/data/widgets/sized_boxes.dart';
import 'package:peso_mate_getx/app/modules/screen_statics/widgets/dropdown_buttons.dart';

import '../controllers/screen_statics_controller.dart';

class ScreenStaticsView extends GetView<ScreenStaticsController> {
  ScreenStaticsView({Key? key}) : super(key: key);

  final ScreenStaticsController staticsController =
      Get.put(ScreenStaticsController());
      final dbController =Get.put(DbHelper());

  @override
  Widget build(BuildContext context) {
    // double mqW = MediaQuery.of(context).size.width;
    // double mqH = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.arrow_left, color: white)),
          title:
              const Text('ScreenStaticsView', style: TextStyle(color: white)),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    sizedH20,
                    DropDownListandButtons(),
                    sizedH20,
                    TransactionsChart(entiredata: dbController.transactionModelList,  height: 300)
                  ],
                ),
              ),
            ),
            CustomPaint(
              painter: MyPainter(),
              child: Container(height: 0),
            ),
          ],
        ));
  }
}
