import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peso_mate_getx/app/data/db_helper/transactions_model.dart';
import 'package:peso_mate_getx/app/data/widgets/colors.dart';
import 'package:peso_mate_getx/app/data/widgets/container_decoration.dart';
import 'package:peso_mate_getx/app/modules/screen_statics/controllers/screen_statics_controller.dart';

class TransactionsChart extends StatelessWidget {
  final List<TransactionModel> entiredata;
  final double height;
  final List<FlSpot> dataset = [];
  final List<FlSpot> datasetIncome = [];
  final List<FlSpot> yearDataSetExpense = [];
  final List<FlSpot> yearDatasetExpense = [];
  TransactionsChart({Key? key, required this.entiredata, required this.height})
      : super(key: key);
  final List<Color> lineColorExp = [amber, red];
  final List<Color> lineColorInc = [amber, green];

  final ScreenStaticsController staticsController =
      Get.put(ScreenStaticsController());

  @override
  build(BuildContext context) {
    double mqH = MediaQuery.of(context).size.height;
    // double mqW = MediaQuery.of(context).size.width;

    if (entiredata.length < 2) {
      return const Center(child: Text('Not enough data to render a chart'));
    } else {
      return Container(
        decoration: containerDecoration(),
        height: mqH * 0.7,
        padding: const EdgeInsets.all(15.0),
        child: Obx(() => LineChart(
              LineChartData(
                  minX: 1,
                  gridData: FlGridData(
                      show: true,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(color: Colors.blue, strokeWidth: 0.5);
                      },
                      getDrawingVerticalLine: (value) {
                        return FlLine(color: Colors.blue, strokeWidth: 0.5);
                      }),
                  backgroundColor: white,
                  titlesData: FlTitlesData(
                    bottomTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: true)),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(
                      border: Border.all(color: Colors.blue, width: 3),
                      show: true),
                  lineBarsData: [
                    LineChartBarData(
                        isCurved: true,
                        preventCurveOverShooting: true,
                        belowBarData: BarAreaData(
                            show: true,
                            color: staticsController.statDropDownValue.value ==
                                    'Expense'
                                ? const Color.fromARGB(97, 244, 67, 54)
                                : const Color.fromARGB(91, 76, 175, 79)),
                        gradient: staticsController.statDropDownValue.value ==
                                'Expense'
                            ? LinearGradient(colors: lineColorExp)
                            : LinearGradient(colors: lineColorInc),
                        spots: staticsController.statDropDownValue.value ==
                                    "Expense" &&
                                staticsController.statIndex.value == 1
                            ? getPlotPointsExpense(entiredata)
                            : staticsController.statDropDownValue.value ==
                                        "Income" &&
                                    staticsController.statIndex.value == 1
                                ? getPlotPoints(entiredata)
                                : staticsController.statDropDownValue.value ==
                                            "Income" &&
                                        staticsController.statIndex.value == 2
                                    ? getYearPlotPointsIncome(entiredata)
                                    : staticsController
                                                    .statDropDownValue.value ==
                                                "Expense" &&
                                            staticsController.statIndex.value ==
                                                2
                                        ? getYearPlotPointsExpense(entiredata)
                                        : getPlotPoints(entiredata),
                        barWidth: 5)
                  ]),
            )),
      );
    }
  }

  List<FlSpot> getPlotPoints(List<TransactionModel> entireData) {
    // final today = DateTime.now();
    TransactionsChart chart =
        TransactionsChart(entiredata: entiredata, height: 300);
    List tempDataSetIncome = [];
    final today = DateTime.now();

    for (TransactionModel data in entireData) {
      if (data.dateTime.month == today.month && data.type == "Income") {
        tempDataSetIncome.add(data);
      }
    }

    tempDataSetIncome.sort((a, b) => a.dateTime.day.compareTo(b.dateTime.day));
    for (var i = 0; i < tempDataSetIncome.length; i++) {
      chart.datasetIncome.add(FlSpot(
          tempDataSetIncome[i].dateTime.day.toDouble(),
          tempDataSetIncome[i].amount.toDouble()));
    }
    return chart.datasetIncome;
  }

  List<FlSpot> getPlotPointsExpense(List<TransactionModel> entireData) {
    final today = DateTime.now();
    TransactionsChart chart =
        TransactionsChart(entiredata: entiredata, height: 300);
    List tempDataSet = [];

    for (TransactionModel data in entireData) {
      if (data.dateTime.month == today.month && data.type == "Expense") {
        tempDataSet.add(data);
      }
    }

    tempDataSet.sort((a, b) => a.dateTime.day.compareTo(b.dateTime.day));
    for (var i = 0; i < tempDataSet.length; i++) {
      chart.dataset.add(FlSpot(tempDataSet[i].dateTime.day.toDouble(),
          tempDataSet[i].amount.toDouble()));
    }

    return chart.dataset;
  }

  int getSumMonth(
      List<TransactionModel> entireData, int month, String transactionType) {
    int sum = 0;
    for (TransactionModel transaction in entireData) {
      if (transaction.dateTime.month == month &&
          transaction.type == transactionType) {
        sum += transaction.amount;
      }
    }
    return sum;
  }

  List<FlSpot> getYearPlotPointsExpense(List<TransactionModel> entireData) {
    TransactionsChart chart =
        TransactionsChart(entiredata: entiredata, height: 300);
    List yearTempDataSetExpense = [];

    for (var i = 1; i <= 12; i++) {
      yearTempDataSetExpense.add(getSumMonth(entiredata, i, "Expense"));
    }

    for (var i = 0; i < yearTempDataSetExpense.length; i++) {
      chart.yearDataSetExpense
          .add(FlSpot(i + 1.toDouble(), yearTempDataSetExpense[i].toDouble()));
    }

    return chart.yearDataSetExpense;
  }

  List<FlSpot> getYearPlotPointsIncome(List<TransactionModel> entireData) {
    TransactionsChart chart =
        TransactionsChart(entiredata: entiredata, height: 300);
    List yearTempDataSetExpense = [];

    for (var i = 1; i <= 12; i++) {
      yearTempDataSetExpense.add(getSumMonth(entiredata, i, "Income"));
    }

    for (var i = 0; i < yearTempDataSetExpense.length; i++) {
      chart.yearDataSetExpense
          .add(FlSpot(i + 1.toDouble(), yearTempDataSetExpense[i].toDouble()));
    }

    return chart.yearDataSetExpense;
  }
}
