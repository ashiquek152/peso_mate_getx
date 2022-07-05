import 'package:get/get.dart';
import 'package:peso_mate_getx/app/data/db_helper/db_helper.dart';
import 'package:peso_mate_getx/app/data/db_helper/transactions_model.dart';
import 'package:peso_mate_getx/app/modules/home/widgets/top_container.dart';

class HomeController extends GetxController {

  final controller = Get.put(DbHelper());
  String? usernameEntered;
  double totalBalance = 0;
  double totalIncome = 0;
  double totalExpense = 0;
  DateTime today = DateTime.now();

  getTotalBalance(List<TransactionModel> alldata) {
    totalBalance = 0;
    totalExpense = 0;
    totalIncome = 0;

    for (TransactionModel data in alldata) {
      if (data.type == 'Income') {
        totalBalance = totalBalance + data.amount;
        totalIncome = totalIncome + data.amount;
      } else {
        totalBalance = totalBalance - data.amount;
        totalExpense = totalExpense + data.amount;
      }
    }
    update();
  }
  
  balanceContainer() {
    getTotalBalance(controller.transactionModelList);
    getName();
    update();
    return TopContainer(
        usernameEntered: usernameEntered,
        totalBalance: totalBalance,
        totalIncome: totalIncome,
        totalExpense: totalExpense);
  }

  Future<void> getName() async {
    usernameEntered = getBox.read('username');
  }
}
