// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:peso_mate_getx/app/data/db_helper/transactions_model.dart';
import 'package:peso_mate_getx/app/data/functions/confirm_delete.dart';
import 'package:peso_mate_getx/app/data/widgets/colors.dart';
import 'package:peso_mate_getx/app/data/widgets/months_list.dart';
import 'package:peso_mate_getx/app/data/widgets/sized_boxes.dart';
import 'package:peso_mate_getx/app/data/widgets/text_widget.dart';
import 'package:peso_mate_getx/app/modules/screen_update/controllers/screen_update_controller.dart';
import 'package:peso_mate_getx/app/modules/screen_update/views/screen_update_view.dart';

class Cards extends StatelessWidget {
  Cards({Key? key, required this.data, required this.pageIndex})
      : super(key: key);
  // final int index;
  final TransactionModel data;
  DateTime? selectedDate;
  final int pageIndex;

  final ScreenUpdateController updateController = ScreenUpdateController();
  
  
  
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    selectedDate = data.dateTime;
    String date = "${selectedDate!.day} ${monthsList[selectedDate!.month - 1]}";
    return pageIndex != 0
        ? Slidable(
            direction: Axis.horizontal,
            key: Key(data.id.toString()),
            startActionPane:
                ActionPane(motion: const ScrollMotion(), children: [
              IconButton(
                  onPressed: () async {
                    await confirmDelete(data.id!, pageIndex);
                  },
                  icon: const Icon(Icons.delete, color: red, size: 35)),
              IconButton(
                  onPressed: () {
                    Get.to(() => ScreenUpdateView(data: data));
                  },
                  icon: Icon(Icons.update, color: amber, size: 35)),
            ]),
            child: transactionTile(w, date))
        : transactionTile(w, date);
  }

  Transform transactionTile(double w, String date) {
    return Transform.translate(
      offset: const Offset(0, 1.2),
      child: InkWell(
        enableFeedback: true,
        onLongPress: () {
          pageIndex != 0
              ? Fluttertoast.showToast(msg: "Slide left to update")
              : null;
        },
        onTap: () {
          pageIndex != 0 ? showTransactionsDetails() : null;
        },
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Container(
          margin: EdgeInsets.only(top: w / 20),
          padding: EdgeInsets.all(w / 20),
          height: w / 4.4,
          width: w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue.withOpacity(.1),
                radius: w / 15,
                child: data.type == "Income"
                    ? const Icon(Icons.arrow_drop_up_sharp,
                        size: 40, color: green)
                    : const Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 40,
                        color: red,
                      ),
              ),
              sizedW10,
              Container(
                alignment: Alignment.centerLeft,
                width: w / 2.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: '${data.amount}',
                      minsize: 11,
                      defaultFont: 16,
                      maxsize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(.7),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        fontFamily: fontComforataa,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(.8),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: TextWidget(
                  text: data.category,
                  color: scaffoldbgnew,
                  minsize: 10,
                  defaultFont: 14,
                  maxsize: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showTransactionsDetails() {
    Get.defaultDialog(
      title: data.type.toUpperCase(),
      titleStyle: TextStyle(color: data.type == "Income" ? green : red),
      content: Column(
        children: [
          Text(data.category),
          Text(data.amount.toString()),
          Text(
              "${data.dateTime.day.toString()}-${data.dateTime.month.toString()}-${data.dateTime.year.toString()}")
        ],
      ),
    );
  }
}
