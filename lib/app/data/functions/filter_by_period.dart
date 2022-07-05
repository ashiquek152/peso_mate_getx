import 'package:flutter/material.dart';
import 'package:peso_mate_getx/app/data/widgets/global_variables.dart';
import 'package:peso_mate_getx/app/data/widgets/transaction_card.dart';

filterExpenseandIncome(
    dataAtindex, tappedMonth, dropdownValue, index, pageIndex) {
  if (tappedMonth == dataAtindex.dateTime.month &&
      dropdownValue == "This year" &&
      dataAtindex.dateTime.year == todayDate.year) {
    {
      return Cards(data: dataAtindex,pageIndex: pageIndex,);
    }
  } else if (dropdownValue == "All") {
    {
      return Cards(data: dataAtindex, pageIndex: pageIndex,);
    }
  } else if (dropdownValue == "Today" &&
      dataAtindex.dateTime.month == todayDate.month &&
      dataAtindex.dateTime.day == todayDate.day) {
    {
      return Cards(data: dataAtindex,pageIndex: pageIndex,);
    }
  } else if (dropdownValue == "This month" &&
      dataAtindex.dateTime.month == todayDate.month) {
    {
      return Cards(data: dataAtindex,pageIndex: pageIndex,);
    }
  } else {
    return const SizedBox();
  }
}
