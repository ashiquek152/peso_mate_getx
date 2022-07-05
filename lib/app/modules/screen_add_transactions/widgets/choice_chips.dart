import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peso_mate_getx/app/data/widgets/colors.dart';
import 'package:peso_mate_getx/app/data/widgets/text_widget.dart';
import 'package:peso_mate_getx/app/modules/screen_add_transactions/controllers/screen_add_transactions_controller.dart';

class ChoiceChipsRowAdd extends StatefulWidget {
  const ChoiceChipsRowAdd({
    Key? key,
  }) : super(key: key);

  @override
  State<ChoiceChipsRowAdd> createState() => _ChoiceChipsRowState();
}

class _ChoiceChipsRowState extends State<ChoiceChipsRowAdd> {
  final ScreenAddTransactionsController addTransactionsController =
      Get.put(ScreenAddTransactionsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScreenAddTransactionsController>(builder: (context) {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(width: 12),
        ChoiceChip(
            label: TextWidget(
                maxsize: 22,
                minsize: 17,
                text: "Income",
                family: 'Comfortaa',
                color: addTransactionsController.type == 'Income'
                    ? white
                    : scaffoldbgnew),
            selectedColor: amber,
            backgroundColor: white,
            selected:
                (addTransactionsController.type == 'Income') ? true : false,
            onSelected: (val) async {
              if (val) {
                setState(() {
                  addTransactionsController.type = 'Income';
                });
              }
            }),
        const SizedBox(width: 12),
        ChoiceChip(
            label: TextWidget(
                maxsize: 22,
                minsize: 17,
                text: "Expense",
                family: 'Comfortaa',
                color: addTransactionsController.type == 'Expense'
                    ? white
                    : scaffoldbgnew),
            selectedColor: amber,
            backgroundColor: white,
            selected:
                addTransactionsController.type == 'Expense' ? true : false,
            onSelected: (val) {
              if (val) {
                setState(() {
                  addTransactionsController.type = 'Expense';
                });
              }
            })
      ]);
    });
  }
}
