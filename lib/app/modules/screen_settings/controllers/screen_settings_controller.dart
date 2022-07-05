import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:peso_mate_getx/app/data/notification_model/notification_model.dart';
import 'package:peso_mate_getx/app/data/widgets/colors.dart';
import 'package:peso_mate_getx/app/modules/screen_splash/views/screen_splash_view.dart';

class ScreenSettingsController extends GetxController {

  bool isTapped = false;
  TimeOfDay? pickedTIme;
  final timeRightNow = TimeOfDay.now();
  bool switchButtonstate = false;




@override
onInit(){
    NotificationApi().init(initScheduled: true);
    listenNotifications();
  super.onInit();
}

  listenNotifications() {
    NotificationApi.onNotifications.listen(onclickNotifications);
  }

  onclickNotifications(String? payload) {
    Get.offAll(const ScreenSplashView());
    }

ontapAbout(context) {
  Get.defaultDialog(
    title: "About",
    content: const Text(
      "Peso Mate is a money management app where you can add all your daily money transactions. This app is made by Ashique under Brototype academy.",
      style: TextStyle(color: scaffoldbgnew, fontSize: 18),
    ),
    titleStyle: TextStyle(color: amber, fontSize: 18),
  );
}


 ontapNotification(context) {
    Get.defaultDialog(
        title: "Notification",
        titleStyle: TextStyle(color: amber, fontSize: 18),
        content: const Text("Add or cancel notifications"),
        actions: [
          ElevatedButton(
              onPressed: () async {
                await pickNotificationTime(context: context);
                Get.back();
              },
              child:
                  Text("Add new", style: TextStyle(color: Colors.teal.shade700))),
          TextButton(
              onPressed: () async {
                await NotificationApi.cancelNotifications();
                Fluttertoast.showToast(
                    backgroundColor: red, msg: "All notifications cleared");
                Get.back();
              },
              child: Text("Cancel all notifications",
                  style: TextStyle(color: Colors.teal.shade700))),
        ]);
  }






 pickNotificationTime({required context}) async {
    pickedTIme = await showTimePicker(
        helpText: "Set time for notification",
        initialEntryMode: TimePickerEntryMode.dial,
        context: context,
        initialTime: timeRightNow);
    if (pickedTIme != null && pickedTIme != timeRightNow) {
      String amORpm = pickedTIme!.hour > 12 ? "PM" : "AM";
      Fluttertoast.showToast(
          backgroundColor: red,
          gravity: ToastGravity.SNACKBAR,
          msg:
              "Notification set at ${pickedTIme!.hour > 12 ? pickedTIme!.hour - 12 : pickedTIme!.hour}:${pickedTIme!.minute} $amORpm");
      NotificationApi.showScheduledNotifications(
          title: "Peso Mate",
          body: "You forgot to add something",
          scheduledTime: Time(pickedTIme!.hour, pickedTIme!.minute, 0));
    }
  }
}
