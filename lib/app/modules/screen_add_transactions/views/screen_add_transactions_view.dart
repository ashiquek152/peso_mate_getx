import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peso_mate_getx/app/data/widgets/button_style.dart';
import 'package:peso_mate_getx/app/data/widgets/colors.dart';
import 'package:peso_mate_getx/app/data/widgets/common_appbar.dart';
import 'package:peso_mate_getx/app/data/widgets/months_list.dart';
import 'package:peso_mate_getx/app/data/widgets/painter_class.dart';
import 'package:peso_mate_getx/app/data/widgets/sized_boxes.dart';
import 'package:peso_mate_getx/app/data/widgets/text_widget.dart';
import 'package:peso_mate_getx/app/modules/screen_add_transactions/widgets/choice_chips.dart';
import 'package:peso_mate_getx/app/modules/screen_add_transactions/widgets/text_formfileld.dart';

import '../controllers/screen_add_transactions_controller.dart';

class ScreenAddTransactionsView
    extends GetView<ScreenAddTransactionsController> {
  ScreenAddTransactionsView({Key? key}) : super(key: key);
  final addTransactionsController = Get.put(ScreenAddTransactionsController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarcommon(
            pageHeading: "Add Transactions",
            actionVisiblity: false,
          )),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Container(
                width: size.width * .9,
                height: size.width * 1.1,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: scfldWhite,
                ),
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: addTransactionsController.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldCustomized(
                        icon: Icons.account_balance_wallet_outlined,
                        formFieldContoller:
                            addTransactionsController.amountController,
                        hintText: "Amount",
                        keyboardType: TextInputType.number,
                      ),
                      sizedH10,
                      TextFieldCustomized(
                        icon: Icons.category_outlined,
                        formFieldContoller:
                            addTransactionsController.catController,
                        hintText: "Category",
                        keyboardType: TextInputType.name,
                      ),
                      const ChoiceChipsRowAdd(),
                       sizedH20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () =>
                              addTransactionsController.selectDate(context),
                            child: Container(
                                color: scfldWhite,
                                height: 50,
                                width: 200,
                                child: Center(
                                  child: Obx(() => 
                                    TextWidget(
                                      text:
                                          "${addTransactionsController.selectedDate.value.day} ${monthsList[addTransactionsController.selectedDate .value.month - 1]}",
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
                              await addTransactionsController.addButtonClick();
                            },
                            child: const TextWidget(
                              text: "Add",
                              maxsize: 18,
                              minsize: 14,
                            )),
                      ),
                     
                    ],
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
      ),
    );
  }
}
