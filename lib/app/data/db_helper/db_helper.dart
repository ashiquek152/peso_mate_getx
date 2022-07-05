import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:peso_mate_getx/app/data/db_helper/transactions_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DbHelper extends GetxController {

RxList<TransactionModel> transactionModelList = <TransactionModel>[].obs;
  


  Future<void> addTrasaction(TransactionModel value) async {
  final moneyManagement = await Hive.openBox<TransactionModel>('MoneyManagement');
  final id = await moneyManagement.add(value);
  value.id = id;
  moneyManagement.put(value.id, value);
  transactionModelList.clear();
  transactionModelList.addAll(moneyManagement.values);
}


Future<void> fetchAllTransactions() async {
  final moneyManagement = await Hive.openBox<TransactionModel>('MoneyManagement');
   transactionModelList.clear();
   transactionModelList.addAll(moneyManagement.values);
   update();
}

void deleteTransaction(int id) async {
  final moneyManagement = await Hive.openBox<TransactionModel>('MoneyManagement');
  await moneyManagement.delete(id);
  await fetchAllTransactions();
  update();
}


  Future updateDB(int id,value) async {
    final moneyManagement = Hive.box<TransactionModel>("MoneyManagement");
    await moneyManagement.put(id, value);
     fetchAllTransactions();
     update();
  }

  Future clearDB() async {
    Hive.box('MoneyManagement').clear();
  }

  Future deleteSharedPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}


final getBox =GetStorage();