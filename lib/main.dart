import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:peso_mate_getx/app/data/db_helper/db_helper.dart';
import 'package:peso_mate_getx/app/data/db_helper/transactions_model.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'app/routes/app_pages.dart';

void main() async   {
   WidgetsFlutterBinding.ensureInitialized();
   await GetStorage.init();
   await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }
  final dbContoller =DbHelper();
  await dbContoller.fetchAllTransactions();
  tz.initializeTimeZones();
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
