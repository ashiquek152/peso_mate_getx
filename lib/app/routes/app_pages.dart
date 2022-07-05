// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/screen_add_transactions/bindings/screen_add_transactions_binding.dart';
import '../modules/screen_add_transactions/views/screen_add_transactions_view.dart';
import '../modules/screen_all_transactions/bindings/screen_all_transactions_binding.dart';
import '../modules/screen_all_transactions/views/screen_all_transactions_view.dart';
import '../modules/screen_expenses/bindings/screen_expenses_binding.dart';
import '../modules/screen_expenses/views/screen_expenses_view.dart';
import '../modules/screen_incomes/bindings/screen_incomes_binding.dart';
import '../modules/screen_incomes/views/screen_incomes_view.dart';
import '../modules/screen_login/bindings/screen_login_binding.dart';
import '../modules/screen_login/views/screen_login_view.dart';
import '../modules/screen_settings/bindings/screen_settings_binding.dart';
import '../modules/screen_settings/views/screen_settings_view.dart';
import '../modules/screen_splash/bindings/screen_splash_binding.dart';
import '../modules/screen_splash/views/screen_splash_view.dart';
import '../modules/screen_statics/bindings/screen_statics_binding.dart';
import '../modules/screen_statics/views/screen_statics_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SCREEN_SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SCREEN_ALL_TRANSACTIONS,
      page: () => ScreenAllTransactionsView(),
      binding: ScreenAllTransactionsBinding(),
    ),
    GetPage(
      name: _Paths.SCREEN_ADD_TRANSACTIONS,
      page: () => ScreenAddTransactionsView(),
      binding: ScreenAddTransactionsBinding(),
    ),
    GetPage(
      name: _Paths.SCREEN_EXPENSES,
      page: () => ScreenExpensesView(),
      binding: ScreenExpensesBinding(),
    ),
    GetPage(
      name: _Paths.SCREEN_INCOMES,
      page: () =>  ScreenIncomesView(),
      binding: ScreenIncomesBinding(),
    ),
    GetPage(
      name: _Paths.SCREEN_LOGIN,
      page: () =>  ScreenLoginView(),
      binding: ScreenLoginBinding(),
    ),
    GetPage(
      name: _Paths.SCREEN_SETTINGS,
      page: () => const ScreenSettingsView(),
      binding: ScreenSettingsBinding(),
    ),
    GetPage(
      name: _Paths.SCREEN_SPLASH,
      page: () => const ScreenSplashView(),
      binding: ScreenSplashBinding(),
    ),
    GetPage(
      name: _Paths.SCREEN_STATICS,
      page: () =>  ScreenStaticsView(),
      binding: ScreenStaticsBinding(),
    ),
    // GetPage(
    //   name: _Paths.SCREEN_UPDATE,
    //   page: () =>  ScreenUpdateView(data: data, index: index),
    //   binding: ScreenUpdateBinding(),
    // ),
  
  ];
}
