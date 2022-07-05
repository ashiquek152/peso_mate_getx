import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenAllTransactionsController extends GetxController {

  final dropdownlist = ['All', 'Today', 'This month', 'This year'];
  var dropdownValue = "All".obs;
  final todayDate = DateTime.now();
  Color buttonColor = Colors.amber;
  bool isButtonClicked = false;
  int selectedIndex = -1;

  RxInt tappedMonth = DateTime.now().month.obs;


  onChangeD(value) async {
    dropdownValue.value = value;
    update();
  }

  onPressedMonth(index)async {
    selectedIndex = index;
    isButtonClicked = true;
    tappedMonth.value = index + 1;
    update();
  }
}



