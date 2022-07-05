import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peso_mate_getx/app/data/db_helper/db_helper.dart';
import 'package:peso_mate_getx/app/data/db_helper/transactions_model.dart';
import 'package:peso_mate_getx/app/data/functions/filter_by_period.dart';
import 'package:peso_mate_getx/app/data/widgets/colors.dart';
import 'package:peso_mate_getx/app/data/widgets/common_appbar.dart';
import 'package:peso_mate_getx/app/data/widgets/painter_class.dart';
import 'package:peso_mate_getx/app/data/widgets/sized_boxes.dart';
import 'package:peso_mate_getx/app/data/widgets/text_widget.dart';
import 'package:peso_mate_getx/app/modules/screen_all_transactions/widgets/drop_down_menu.dart';
import 'package:peso_mate_getx/app/modules/screen_all_transactions/widgets/scrolling_months_row.dart';
import 'package:peso_mate_getx/app/modules/screen_statics/views/screen_statics_view.dart';

import '../controllers/screen_all_transactions_controller.dart';

class ScreenAllTransactionsView
    extends GetView<ScreenAllTransactionsController> {
  ScreenAllTransactionsView({Key? key}) : super(key: key);



  final ScreenAllTransactionsController allTranController =
      Get.put(ScreenAllTransactionsController());
  final dbController = Get.put(DbHelper());

  @override
  Widget build(BuildContext context) {
    dbController.fetchAllTransactions();
    double mqw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: scfldWhite,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarcommon(
            pageHeading: "All Transactions",
            actionVisiblity: false,
          )),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: mqw / 13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: ()=>Get.to( ScreenStaticsView()),
                        child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: amber,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const TextWidget(text: "Stats",color: white,fontWeight: FontWeight.bold,maxsize: 16,minsize: 14,),
                      )),
                      sizedW10,
                      Container(
                        width: 140,
                        color: white,
                        child: DropDwnList(),
                      )
                    ],
                  ),
                  sizedH10,
                  Obx(() => Visibility(
                      visible:allTranController.dropdownValue.value == "This year" ? true: false,
                      child: ScrollingMonthsListAll(),
                    ),
                  ),
                 Obx(()=> ListView.builder(
                      reverse: true,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: dbController.transactionModelList.length,
                      itemBuilder: (context, index) {
                        TransactionModel dataAtindex =
                            dbController.transactionModelList[index];
                        return Obx(()=>filterExpenseandIncome(
                          dataAtindex,
                          allTranController.tappedMonth,
                          allTranController.dropdownValue,
                          index,
                          1
                        ));
                      }),)
                ],
              ),
            ),
          ),
          CustomPaint(
            painter: MyPainter(),
            child: Container(height: 0),
          ),
        ],
      ),
    );
  }
}
