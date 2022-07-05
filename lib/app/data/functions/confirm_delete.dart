import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peso_mate_getx/app/data/db_helper/db_helper.dart';
import 'package:peso_mate_getx/app/data/widgets/colors.dart';

Future confirmDelete(int id,int pageIndex) async {
  Get.defaultDialog(
    title: "Delete !",
    middleText: "Are you sure ?",
    titleStyle: TextStyle(color: amber, fontSize: 20),
    actions: [
      ElevatedButton(
          onPressed: () async {
            final dbController = Get.put(DbHelper());
            dbController.deleteTransaction(id);
            Get.back();
            // switch (pageIndex) {
            //   case 0:
            //   Get.off(()=>HomeView());
            //     break;
            //   case 1:
            //   Get.off(()=>ScreenAllTransactionsView());
            //   break;
            //   case 2:
            //   Get.off(()=>  ScreenIncomesView());
            //   break;
            //   case 3:
            //   Get.off(()=>ScreenExpensesView());
            //   break;
            //   default:
            // Get.off(()=>HomeView());
            // }
          },
          child: const Text("DELETE")),
      ElevatedButton(onPressed: () => Get.back(), child: const Text("CANCEL"))
    ],
  );
}
