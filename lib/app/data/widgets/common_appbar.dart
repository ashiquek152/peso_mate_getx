import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:peso_mate_getx/app/data/widgets/colors.dart';
import 'package:peso_mate_getx/app/data/widgets/text_widget.dart';
import 'package:peso_mate_getx/app/modules/home/views/home_view.dart';

class AppBarcommon extends StatelessWidget {
  const AppBarcommon({
    Key? key,
    required this.actionVisiblity,
    required this.pageHeading,
  }) : super(key: key);

  final String pageHeading;
  final bool actionVisiblity;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: amber,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        title: TextWidget(
          text: pageHeading,
          family: 'Swera',
          color: white,
          maxsize: 20,
          minsize: 16,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            enableFeedback: true,
            icon: const Icon(CupertinoIcons.arrow_left,
                size: 30, color: scfldWhite),
            onPressed: () {
              Get.offAll(
                () => HomeView(),
                transition: Transition.downToUp,
                duration: const Duration(seconds: 1)
              );
            }));
  }
}
