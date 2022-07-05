
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peso_mate_getx/app/data/widgets/colors.dart';
import 'package:peso_mate_getx/app/data/widgets/text_widget.dart';
import 'package:peso_mate_getx/app/modules/screen_update/controllers/screen_update_controller.dart';

class ChoiceChipsRowUpdate extends StatefulWidget {
  const ChoiceChipsRowUpdate({
    Key? key,
  }) : super(key: key);

  @override
  State<ChoiceChipsRowUpdate> createState() => _ChoiceChipsRowState();
}

class _ChoiceChipsRowState extends State<ChoiceChipsRowUpdate> {
  final ScreenUpdateController updateController =
      Get.put(ScreenUpdateController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScreenUpdateController>(builder: (context) {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(width: 12),
        ChoiceChip(
            label: TextWidget(
                maxsize: 22,
                minsize: 17,
                text: "Income",
                family: 'Comfortaa',
                color: updateController.type == 'Income'
                    ? white
                    : scaffoldbgnew),
            selectedColor: amber,
            backgroundColor: white,
            selected:
                (updateController.type == 'Income') ? true : false,
            onSelected: (val) async {
              if (val) {
                setState(() {
                  updateController.type = 'Income';
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
                color: updateController.type == 'Expense'
                    ? white
                    : scaffoldbgnew),
            selectedColor: amber,
            backgroundColor: white,
            selected:
                updateController.type == 'Expense' ? true : false,
            onSelected: (val) {
              if (val) {
                setState(() {
                  updateController.type = 'Expense';
                });
              }
            })
      ]);
    });
  }
}
