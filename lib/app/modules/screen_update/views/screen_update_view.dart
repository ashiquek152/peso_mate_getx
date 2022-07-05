import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peso_mate_getx/app/data/db_helper/transactions_model.dart';
import 'package:peso_mate_getx/app/data/widgets/button_style.dart';
import 'package:peso_mate_getx/app/data/widgets/colors.dart';
import 'package:peso_mate_getx/app/data/widgets/common_appbar.dart';
import 'package:peso_mate_getx/app/data/widgets/months_list.dart';
import 'package:peso_mate_getx/app/data/widgets/painter_class.dart';
import 'package:peso_mate_getx/app/data/widgets/sized_boxes.dart';
import 'package:peso_mate_getx/app/data/widgets/text_widget.dart';
import 'package:peso_mate_getx/app/modules/screen_update/widgets/text_field_in_update.dart';

import '../controllers/screen_update_controller.dart';

// ignore: must_be_immutable
class ScreenUpdateView extends StatelessWidget {
  ScreenUpdateView({
    Key? key,
    required this.data,
  }) : super(key: key);

  final TransactionModel data;

  final ScreenUpdateController updateController = ScreenUpdateController();
  
  @override
  Widget build(BuildContext context) {
    
    updateController.onView(data);

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBarcommon(
                actionVisiblity: false,
                pageHeading:
                    data.type == "Expense" ? "Edit Expense" : "Edit Income")),
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: scfldWhite,
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      key: updateController.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFieldInUpdate(
                              hintText: 'Amount',
                              formFieldContoller:
                                  updateController.amountController,
                              icon: Icons.account_balance_wallet_outlined,
                              keyboardType: TextInputType.number),
                          TextFieldInUpdate(
                            hintText: "Category",
                            keyboardType: TextInputType.text,
                            icon: Icons.category_outlined,
                            formFieldContoller: updateController.catController,
                          ),
                          sizedH20,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => updateController.selectDate(context),
                                child: Container(
                                    color: scfldWhite,
                                    height: 50,
                                    width: 200,
                                    child: Center(
                                      child: Obx(
                                        () => TextWidget(
                                          text:
                                              "${updateController.selectedDate.value.day} ${monthsList[updateController.selectedDate.value.month - 1]}",
                                          color: scaffoldbgnew,
                                          fontWeight: FontWeight.bold,
                                          maxsize: 18,
                                          minsize: 12,
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          sizedH20,
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                                style: buttonStyle(color: amber),
                                onPressed: () async {
                                  await updateController.onButtonClick();
                                },
                                child: const TextWidget(
                                  text: "Update",
                                  maxsize: 18,
                                  minsize: 14,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              CustomPaint(
                painter: MyPainter(),
                child: Container(height: 0),
              ),
            ],
          ),
        ));
  }
}
