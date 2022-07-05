import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peso_mate_getx/app/data/widgets/colors.dart';
import 'package:peso_mate_getx/app/data/widgets/months_list.dart';
import 'package:peso_mate_getx/app/modules/screen_all_transactions/controllers/screen_all_transactions_controller.dart';

class ScrollingMonthsListAll extends StatelessWidget {
  ScrollingMonthsListAll({Key? key}) : super(key: key);

  final allTranController = Get.put(ScreenAllTransactionsController());

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        height: 60,
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              GetBuilder<ScreenAllTransactionsController>(builder: (context) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: monthsList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary:
                                    allTranController.selectedIndex == index
                                        ? white
                                        : amber),
                            onPressed: () {
                              allTranController.onPressedMonth(index);
                            },
                            child: Text(
                              monthsList[index].toString(),
                              style: const TextStyle(color: scaffoldbgnew),
                            )),
                      );
                    });
              }),
            ])));
  }
}
