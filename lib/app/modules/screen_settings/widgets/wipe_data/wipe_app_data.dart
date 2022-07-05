import 'package:flutter/material.dart';
import 'package:peso_mate_getx/app/data/db_helper/db_helper.dart';
import 'package:peso_mate_getx/app/data/widgets/button_style.dart';
import 'package:peso_mate_getx/app/data/widgets/colors.dart';
Future<dynamic> wipeAppdata(context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
            "Are you sure want to clear all data ?",
            style: TextStyle(color: scaffoldbgnew),
          ),
          actions: [
            TextButton(
                style: buttonStyle(color: amber),
                onPressed: () {
                  DbHelper dbHelper = DbHelper();
                  dbHelper.clearDB();
                  dbHelper.deleteSharedPref();
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(
                  //         builder: (context) => const Splashpage2()),
                  //     (route) => false);
                },
                child: const Text(
                  "Clear",
                  style: TextStyle(color: scfldWhite),
                )),
            TextButton(
                style: buttonStyle(color: white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:  Text(
                  "Cancel",
                  style: TextStyle(color: amber),
                ))
          ],
          backgroundColor: scfldWhite,
        );
      });
}

Future settingsTiles({required title, required content, context}) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentTextStyle: const TextStyle(color: Colors.white),
        backgroundColor: scaffoldbgnew,
        title: const Text(
            "Are you sure want to clear all data ?",
            style: TextStyle(color: scfldWhite),
          ),
        content: 
         const Text(
            "Are you sure want to clear all data ?",
            style: TextStyle(color: scfldWhite),
          ),
        actions: [
          Center(
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                "Close",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      );
    },
  );
}
