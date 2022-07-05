import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:peso_mate_getx/app/data/db_helper/db_helper.dart';
import 'package:peso_mate_getx/app/data/db_helper/transactions_model.dart';
import 'package:peso_mate_getx/app/data/widgets/button_style.dart';
import 'package:peso_mate_getx/app/data/widgets/colors.dart';
import 'package:peso_mate_getx/app/data/widgets/painter_class.dart';
import 'package:peso_mate_getx/app/data/widgets/text_widget.dart';
import 'package:peso_mate_getx/app/data/widgets/transaction_card.dart';
import 'package:peso_mate_getx/app/modules/screen_add_transactions/views/screen_add_transactions_view.dart';
import 'package:peso_mate_getx/app/modules/screen_all_transactions/views/screen_all_transactions_view.dart';

import '../controllers/home_controller.dart';

// var pre_backpress;

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final dbController = Get.put(DbHelper());
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    dbController.fetchAllTransactions();
    double mqW = MediaQuery.of(context).size.width;
    double mqH = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: scfldWhite,
      appBar: AppBar(
          backgroundColor: amber,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
          title: const TextWidget(
              text: "Peso Mate",
              family: 'Swera',
              color: white,
              maxsize: 40,
              minsize: 30),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                tooltip: 'Settings',
                enableFeedback: true,
                icon: const Icon(
                  CupertinoIcons.gear_alt_fill,
                ),
                onPressed: () => Get.toNamed("/screen-settings"))
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          splashColor: white,
          backgroundColor: amber,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          onPressed: () => Get.to(()=>ScreenAddTransactionsView()),
          child: const Icon(Icons.add, size: 35.0)),
      body: Stack(
        children: [
          SingleChildScrollView(
            child:  Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                    children: [
                      Obx(()=>homeController.balanceContainer()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Recent Transactions',
                            style: TextStyle(
                                fontFamily: fontComforataa,
                                fontSize: mqW / 20,
                                color: amber,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                  height: mqH / 25,
                                  width: mqW / 2.5,
                                  child: ElevatedButton.icon(
                                    icon: Icon(
                                      Icons.arrow_circle_right_outlined,
                                      color: scfldWhite,
                                      size: mqW / 15,
                                    ),
                                    style: buttonStyle(color: amber),
                                    label: const TextWidget(
                                      text: "See all",
                                      fontWeight: FontWeight.bold,
                                      color: scfldWhite,
                                      maxsize: 16,
                                      defaultFont: 14,
                                      minsize: 12,
                                    ),
                                    onPressed: () {
                                      Get.to(()=>ScreenAllTransactionsView());
                                    },
                                  ))),
                        ],
                      ),
                      Obx(()=>
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: dbController.transactionModelList.length < 5
                                ? dbController.transactionModelList.length
                                : 5,

                          itemBuilder: (context, index) {
                            final newList =
                                dbController.transactionModelList.reversed;
                            final TransactionModel dataAtindex =
                                newList.elementAt(index);
                            if (dataAtindex.type == 'Income') {
                              return Cards(data: dataAtindex,pageIndex: 0);
                            } else {
                              return Cards(data: dataAtindex,pageIndex: 0);
                            }
                          }),)
                      
                    ],
                  ),
            ),
          ),
          CustomPaint(
            painter: MyPainter(),
            child: Container(height: 0),
          )
        ],
      ),
    );
  }
}
