import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peso_mate_getx/app/data/widgets/colors.dart';
import 'package:peso_mate_getx/app/data/widgets/text_widget.dart';
import 'package:peso_mate_getx/app/modules/screen_all_transactions/controllers/screen_all_transactions_controller.dart';

class DropDwnList extends StatelessWidget {
  DropDwnList({Key? key}) : super(key: key);

  final allTranController = Get.put(ScreenAllTransactionsController());

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: const InputDecoration.collapsed(hintText: ''),
      dropdownColor: amber,
      iconSize: 30,
      iconEnabledColor: scaffoldbgnew,
      hint: const Padding( 
          padding: EdgeInsets.only(left: 10),
          child: TextWidget(
            text: "All",
            color: scaffoldbgnew,
            maxsize: 16,
            minsize: 12,
          )),
      onChanged: (value) => allTranController.onChangeD(value),
      items: allTranController.dropdownlist.map((e) {
        return DropdownMenuItem(
          value: e,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: TextWidget(
              text: e,
              color: scaffoldbgnew,
              maxsize: 15,
              minsize: 11,
            ),
          ),
        );
      }).toList(),
    );
  }
}
