import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peso_mate_getx/app/data/widgets/common_appbar.dart';
import 'package:peso_mate_getx/app/data/widgets/painter_class.dart';
import 'package:peso_mate_getx/app/modules/screen_settings/widgets/settings_tiles/settings_tiles.dart';

import '../controllers/screen_settings_controller.dart';

class ScreenSettingsView extends GetView<ScreenSettingsController> {
  const ScreenSettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarcommon(
            pageHeading: "Settings",
            actionVisiblity: false,
          )),
      body: Stack(
        children: [
          ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              SettingsTiles(
                  avatar: Icons.info,
                  contents: "",
                  title: "About",
                  tileIndex: 1,
                  w: w),
              SettingsTiles(
                  avatar: Icons.alarm,
                  contents: "",
                  title: "Notifications",
                  tileIndex: 2,
                  w: w),
              SettingsTiles(
                  avatar: Icons.replay_circle_filled_outlined,
                  contents: "",
                  title: "Reset App",
                  tileIndex: 3,
                  w: w),
            ],
          ),
          CustomPaint(
            painter: MyPainter(),
            child: Container(height: 0),
          ),
        ],
      ),
    );
  }
}
