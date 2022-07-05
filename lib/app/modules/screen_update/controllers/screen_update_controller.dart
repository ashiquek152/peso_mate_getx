import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peso_mate_getx/app/data/db_helper/db_helper.dart';
import 'package:peso_mate_getx/app/data/db_helper/transactions_model.dart';
import 'package:peso_mate_getx/app/data/widgets/toast.dart';

class ScreenUpdateController extends GetxController {
  final dbController = Get.put(DbHelper());

  GlobalKey<FormState> formKey = GlobalKey();

  int amount=1;
  String category = 'No category Added';
  String? type = "Income";
  Rx<DateTime> selectedDate = DateTime.now().obs;
  int? id;

  final amountController = TextEditingController();
  final catController = TextEditingController();

  Future<void> selectDate(context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: selectedDate.value,
      firstDate: DateTime(2019, 06),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      update();
    }
  }

  onChangedAmount(val) {
    amount = int.parse(val);
    update();
  }

  onChangedCat(val) {
    category = val;
    update();
  }

  Future onButtonClick() async {
    if ((formKey.currentState!.validate())) {
      final transaction = TransactionModel(
        amount:amount,
        category: category,
        dateTime: selectedDate.value,
        type: type!,
      );
      await dbController.updateDB(transaction.id!, transaction);
      toastMessage("Data updated !");
      Get.back();
    }
  }

  onView(TransactionModel data) {
    amountController.text = data.amount.toString();
    catController.text = data.category;
    type = data.type;
    selectedDate.value = data.dateTime;
    id = data.id!;
  }
}
