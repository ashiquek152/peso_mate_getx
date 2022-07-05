import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peso_mate_getx/app/data/widgets/colors.dart';
import 'package:peso_mate_getx/app/modules/screen_settings/controllers/screen_settings_controller.dart';
import 'package:peso_mate_getx/app/modules/screen_settings/widgets/wipe_data/wipe_app_data.dart';

class SettingsTiles extends GetView<ScreenSettingsController> {
   SettingsTiles({
    Key? key,
    required this.avatar,
    required this.contents,
    required this.title,
    required double w,
    required this.tileIndex,
  })  : _w = w,
        super(key: key);

  final double _w;
  final String title;
  final IconData avatar;
  final String? contents;
  final int tileIndex;
  final settingsController = Get.put(ScreenSettingsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0,16.0,16.0,0),
      child: Container(
        decoration:  BoxDecoration(
          color: scfldWhite,
          borderRadius: BorderRadius.circular(10)
        ),
         height: _w / 4.4,
        width: _w,
        child: Center(
          child: ListTile(
            title: Text(title),
            leading: CircleAvatar(child: Icon(avatar,color: amber,),),
             onTap: () {
              switch (tileIndex) {
                case 1:
                  settingsController.ontapAbout(context);
                  break;
                case 2:
                 settingsController.ontapNotification(context);
                  break;
                case 3:
                  wipeAppdata(context);
                  break;
              }
            },
          ),
        ),
      ),
    );
  }
}
